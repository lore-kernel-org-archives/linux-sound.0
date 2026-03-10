Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680DF3C3BF4;
	Tue, 10 Mar 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138475; cv=none; b=HcDVKmtyZ6AIs/zwHr5uTJSZn47IWnEaQ/1VJk9MNyNOOy7sqmOjRCjv8XS475DhAa7o4Z1oE1Iq4PrysKlENkGR4I4obgUQDHYAe8YWh3H8HsGtcq8i1iZT56n4PDcE1RLUQ3ywMuPaSwzBqH62I+Vt/JH4EHp2ialL39QTxA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138475; c=relaxed/simple;
	bh=Ye9zahuMoiiz50HQYaUBa21+WMOhRsmVDLOyu0Y0n9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZDojU66R1XShD2VZQOWIXcGtLJXK9ACTy9nxQ/X3c4uXh32/lq9tyCmHhAZgroOqwscZuXIkUG/iPhuGJw5663eEu7laFzc4hfIVOjHBVorgagvtwiyjUnB5U0hub7bnTR8jdt0mc7bAjYL1O4UpTfIfpoNQGEZ3d2n77hVc2kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=N0cYl9xn; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="N0cYl9xn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=ltXH0xX3BrrWOHX+Xkq1ztdbVWtiZUnyjqqcCM0EWJQ=; b=N0cYl9xnCzJDqT
	SYeCZrWtUo8Aeoxkv12B0zIIAS1S6zxMCqYFsz+BqYDxEcWNm07lon90yIDjXoqpD2GT6hePlUDQZ
	IMb6lWKMlpiNMxXmStjAODMCgtzrFhsSdcMO3F9VA8iDHroZu2tI5wKtfrt+/wqPUCttZN/WroEs0
	FT0OGApZhQ+7GBlx+iIIVqlaNeILJeYfppcVjUXr69mX7rGTRkiUi5FSJwYAr1DQt0CEDZXlmPD5F
	pdyb8cvGEOe9Vf4BRLp7eMXaHTkcsMpgE5T8N18evpH1yfcJgNzNitMe1Wf0G/czt0Lw4/yIIONUo
	LRfaCbn83BL1axpZ0LYQ==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vzuJM-00CNjF-NR; Tue, 10 Mar 2026 10:27:36 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vzuJM-00000000ReM-0zWR;
	Tue, 10 Mar 2026 10:27:36 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	sound-open-firmware@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kai.vehmanen@linux.intel.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ASoC: SOF: sof-audio: pcm_id is __le32
Date: Tue, 10 Mar 2026 10:27:35 +0000
Message-Id: <20260310102735.106277-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The pcm_id value is __le32 so convert it before passing to the dev_dbg
function to be printed. Picked up by sparse prototype for variadic and printf
function checking.

Fixes a large number of sparse warnings, such as:

sound/soc/sof/pcm.c:84:25: warning: incorrect type in argument 4 (different base types)
sound/soc/sof/pcm.c:84:25:    expected unsigned int
sound/soc/sof/pcm.c:84:25:    got restricted __le32 [usertype] pcm_id

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 sound/soc/sof/sof-audio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 36082e764bf9..e044a102eeb5 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -641,7 +641,8 @@ void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
  */
 #define spcm_dbg(__spcm, __dir, __fmt, ...)					\
 	dev_dbg((__spcm)->scomp->dev, "pcm%u (%s), dir %d: " __fmt,		\
-		(__spcm)->pcm.pcm_id, (__spcm)->pcm.pcm_name, __dir,		\
+		le32_to_cpu((__spcm)->pcm.pcm_id),				\
+		(__spcm)->pcm.pcm_name, __dir,					\
 		##__VA_ARGS__)
 
 #define spcm_dbg_ratelimited(__spcm, __dir, __fmt, ...)				\
-- 
2.37.2.352.g3c44437643

