Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFED33A005;
	Mon, 16 Mar 2026 18:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684347; cv=none; b=l6VJoqAs1wqE5VBET8AoK5crytsbz+sO/TqG+j0j+Q1eYfDelQGtunMtWd5rxh3w0cT063lo9zm7ELEa9NrcBtTzitOCaPDlh4AdemYAeabU9avbkYyLia2bgaFE+FXhWLrtOMiu1kLJLy6fiDVAP5NPxGtCGapEZ3OA+41kcrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684347; c=relaxed/simple;
	bh=HaYwwuUwKVrbRIX35Hk4Avvlv44gxoippSdy/+MMh5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmJcOVsIywqTPZFSTcHFwuyjeVBU2b47+d4jWKGr8TaAo5lvNv1CsdOSoZ4y38UrGSxBFKCUn06YRbl+EYy12fTXetCq28H4qv44UWYVFArgH+kINTrwmy0/g76ZBCKcv5iOiDphNuwnkDvA9af5VZqIg4ivIZch0PiL3UdnAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8577DC19421;
	Mon, 16 Mar 2026 18:05:46 +0000 (UTC)
From: Joseph Salisbury <joseph.salisbury@oracle.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_easrc: fix comment typo
Date: Mon, 16 Mar 2026 14:05:45 -0400
Message-ID: <20260316180545.144032-1-joseph.salisbury@oracle.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file contains a spelling error in a source comment (funciton).

Typos in comments reduce readability and make text searches less reliable
for developers and maintainers.

Replace 'funciton' with 'function' in the affected comment. This is a
comment-only cleanup and does not change behavior.

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Joseph Salisbury <joseph.salisbury@oracle.com>
---
 sound/soc/fsl/fsl_easrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 6c56134c60cc..599e439b359a 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1286,7 +1286,7 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 /*
  * Release the context
  *
- * This funciton is mainly doing the revert thing in request context
+ * This function is mainly doing the revert thing in request context
  */
 static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 {
-- 
2.47.3

