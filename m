Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D96275AEB;
	Sun, 26 Jul 2026 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785100396; cv=none; b=MPqsCIrxsM35dO0VG9/8VIgHLDEqgjtBFmHAed52eGlhfIlXJOsXDmhgpkFdt66d57EmXDn1GZRNEBA4EhHsYvBLLsN0JGj9EnXH7Y9R5GngaGo69MgyINuKPuLYypi+W1gdoQP3cikWO/EAgueOXUiQ1ps01RgrN+pllSzfd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785100396; c=relaxed/simple;
	bh=OofGKcIUoFzEcRTCJuxNINtz3GSGF+vRAone6kQl29Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOxrcYNxchlcyeamN4ogBGsfiUHJl72MjGh3HVvB+SnVI3Uv9qwGOAAn1QRhcBMGqHGt4EfaxeSRmj/L6msATwB8gyA2p2JEsU02rk/62gqv4zNHtZau42ofDtJapzgzpnh8mPkPkPTh8tPjg0SaIFGfQeLHG6faXZcRjAc8Z9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from MTA-15-3.privateemail.com (mta-15.privateemail.com [198.54.118.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4h7ZFb1Hg3z2x9s;
	Sun, 26 Jul 2026 17:13:07 -0400 (EDT)
Received: from mail.privateemail.com (K8S-PROD-WORKER-04 [87.215.145.39])
	by mta-15.privateemail.com (Postfix) with ESMTPA id 4h7ZFC2jdxz3hhTB;
	Sun, 26 Jul 2026 17:12:47 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm: keep the graph start count in sync with the DSP
Date: Sun, 26 Jul 2026 23:12:26 +0200
Message-ID: <20260726211226.94059-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

q6apm_graph_start() increments start_count even when APM_CMD_GRAPH_START
fails, leaving the graph counted as running while the DSP never started
it. A later start - a retried prepare, or a resume after a failed start -
then finds a non-zero count, skips the command and returns success with
no data flowing.

Count the graph only once the DSP has accepted the start. The count then
stays at zero for a graph that never started, so also stop decrementing
below zero in q6apm_graph_stop(): the compressed free path stops
unconditionally, and a negative count would make the next start skip the
command in the same way.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
Found by inspection while working on MI2S clocking on the Fairphone
(Gen. 6); I have not hit either path on hardware, so no stable Cc - say
the word if you want one.

One patch, because the start hunk alone would leave q6apm_dai_compr_free()
able to take the count negative - a bisect hole. That call became
unbalanced with 88b60bf047fd ("ASoC: q6dsp: q6apm-dai: Add open/free
compress DAI callbacks"), but the counting logic is from the Fixes commit.
A never-started graph is still torn down by APM_CMD_GRAPH_CLOSE.

The guard is in the helper to keep the count in one place; the equivalent
check in the compressed free path, as q6apm_dai_close() has it, works too.

 sound/soc/qcom/qdsp6/q6apm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 641d6d243229..f167b9dae3fa 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -802,14 +802,17 @@ EXPORT_SYMBOL_GPL(q6apm_graph_prepare);
 int q6apm_graph_start(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
-	int ret = 0;
+	int ret;
 
-	if (ar_graph->start_count == 0)
+	if (ar_graph->start_count == 0) {
 		ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_START);
+		if (ret)
+			return ret;
+	}
 
 	ar_graph->start_count++;
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_start);
 
@@ -817,6 +820,9 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
 
+	if (ar_graph->start_count == 0)
+		return 0;
+
 	if (--ar_graph->start_count > 0)
 		return 0;
 

base-commit: 4c4a11fdf61ca56a08ea05635a1479b9bee666f4
-- 
2.55.0

