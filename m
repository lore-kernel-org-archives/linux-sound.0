Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850304A43E9
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461913; cv=none; b=fS/xFv5UsG+3vTLpBr/sMhhKB7JIX8Reguc3KxFf3C/aWXdKB8rFATwXTvQv+NNYMYLZFD4XJGBd3Rc+Sj135GKN+sruxlWQMqSuibhxqjk8rAc0ZajLRnsISfLMX/S2W7KHkkuKCJ2FuEC/H77q0XmPGnoTblvv9SuRsD6bPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461913; c=relaxed/simple;
	bh=mTix+tHFqz/K6EHXch/VXgMJzAY/s6N3yALq3Rr1p2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWvhNDx7kH7KtalcIyu2sFSc/IoYgUYp8Bm3I4PgPj3FTuo45lNW6YABaOYTvxHfSijW4yaeVdcam3z/KnnTx7SBrT7kDuHcEVdmN/gDV2S77djsfJz0gDk4gN+CIylf1HFCxiu7Y3HRygToDrqJZUQPk6vvhHqehp6yhdnEfCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBl37h9y; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBl37h9y"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso2260231a91.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461912; x=1790066712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9TZDSMbnuEhFGKGm7MDVdWVy6UrGTdWqyN+axgcMGY=;
        b=JBl37h9yCKJZHoObtnW+g2mGo7vxu+J7lJtC3SJ7uEaOki8O73hfFwyBgq0EshkBao
         Flir/lwzmAf80rNapV4br6lOI6dikVEGFpI7K904saXPq2js6SoKZ83AVkyAchiegT8X
         z1F/aGriSGawUeAC0YLRUuu2fWudCE/H1JnokJY29x/QZ1OBIGJAmnnkQMmg+QD0W3Ei
         ClOm6TvecQOj44bmRTExkDi7JoWt4XR/jcHXd0TIpgUcNrR5/8fJSXiWyyrll/Yy4qwA
         tAIMPqoEnR5rHgduwOtsGTN4b/SfwYJeoXCxxRU8yTBkPeFtEfCzVvrtdunoPCH38WYo
         Ugmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461912; x=1790066712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9TZDSMbnuEhFGKGm7MDVdWVy6UrGTdWqyN+axgcMGY=;
        b=m8tA24/f6i0lGLtpBhvEBBxEVBoC5c7Nl5z7hsS2klosXH5odx9hhhOAYGtWyfkSMu
         jAlZOg6Eqfr5CdRjdlTgqMhBSCYe0OAxt1yckCTMKJw7A2tV9hZjBYT/j9KhCDLUYBWU
         Wx2gbstudeQZeCeLf+0o8KvrDs0KlE1FrOTPF4Y8y3JR6J1JAqn2hE6+STyJedAcGyke
         lVTwEyeb2M5/2mWqx9cpVf21DTIFdos0xfEFUGbDES4DZ77rcgjBxUb8hBMzrjwhjdeG
         H3LPSr0Lsbt7J5+glWajd/e8cHyq85RjL2TMx8LaYQC+XMvic+sLU95QpFfNUwH+FfJ6
         mnJQ==
X-Gm-Message-State: AFuF++kVH7qWLDh0B0mJFx3y8UQPK1wNXgbwu7Z7ZaBIZwFIS2pJ2L7O
	8+8A4Bcy2ZYsGuJic0k5/lYR+3jEDIfIDrqbSEbrDsXglvCq5jW9cilP
X-Gm-Gg: AYBFou3FyahhXMh3GMS8znwce6KEWPOOSgzgNYufqAVDa97wdpWLadSkTQsZZgfu7VB
	RsV2nRk+LiTvimd3WQVSvS6A5Fyqun1YcLieTy5N0gjCxHjh/mi1QmJQ3yk9C8n1mf4D+UK/oS8
	qQBDX+84QZBUdfWecOa2HbOLLvUhjsSRErxkzWYtpYG3+e9OHfjhTW6/6X10rx3cyy5FO9MNy7S
	s283b7NP1tAq22v3jhy42FQ+ua/VmvvAEODb8OiEHytO0WXlNlg61QVlkGsYSgE1Zq2Vy19L+sF
	bi2YyoOXH6nSklo3YiPHFIo0JIpckaL+YRb8c/jzUaw1u5s7TMKwDbJwcd3te3EnUE/BVUe0Prc
	6awMs7wakmHteesscU1hMF2IBHc3TMfHelGkTS462uwtWi6iFmcRLNkwKNt3gXJnXBUuRg39eWD
	jkgynzzRMbtZavlVJl3EijEEN76DSJY0beQK4mnr5d0cWoGVvmRNXOOBmIwIuqkn70O9OlpmSwH
	imnLXYoARjZqlNioXIl8LvffQ==
X-Received: by 2002:a17:90a:c2cd:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39df2a10424mr10369646a91.15.1789461911702;
        Tue, 15 Sep 2026 01:45:11 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 15/23] ALSA: cs46xx: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:16 +0530
Message-ID: <20260915084424.1007757-16-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/cs46xx/cs46xx_lib.c       | 6 +++---
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 19a6927c079d..a16586f7d913 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -315,7 +315,7 @@ int snd_cs46xx_download(struct snd_cs46xx *chip,
 	dst = chip->region.idx[bank+1].remap_addr + offset;
 	len /= sizeof(u32);
 
-	/* writel already converts 32-bit value to right endianess */
+	/* writel already converts 32-bit value to right endianness */
 	while (len-- > 0) {
 		writel(*src++, dst);
 		dst += sizeof(u32);
@@ -474,7 +474,7 @@ int snd_cs46xx_clear_BA1(struct snd_cs46xx *chip,
 	dst = chip->region.idx[bank+1].remap_addr + offset;
 	len /= sizeof(u32);
 
-	/* writel already converts 32-bit value to right endianess */
+	/* writel already converts 32-bit value to right endianness */
 	while (len-- > 0) {
 		writel(0, dst);
 		dst += sizeof(u32);
@@ -3039,7 +3039,7 @@ static int snd_cs46xx_chip_init(struct snd_cs46xx *chip)
 #endif
 
 	/*
-	 *  Assert the vaid frame signal so that we can start sending commands
+	 *  Assert the valid frame signal so that we can start sending commands
 	 *  to the AC97 codec.
 	 */
 	snd_cs46xx_pokeBA0(chip, BA0_ACCTL, ACCTL_VFRM | ACCTL_ESYN | ACCTL_RSTN);
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index fd19365026b4..71eee5cb478f 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -160,15 +160,15 @@ void cs46xx_dsp_remove_scb (struct snd_cs46xx *chip, struct dsp_scb_descriptor *
 {
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
-	/* check integrety */
+	/* check integrity */
 	if (snd_BUG_ON(scb->index < 0 ||
 		       scb->index >= ins->nscb ||
 		       (ins->scbs + scb->index) != scb))
 		return;
 
 #if 0
-	/* can't remove a SCB with childs before 
-	   removing childs first  */
+	/* can't remove a SCB with children before
+	   removing children first  */
 	if (snd_BUG_ON(scb->sub_list_ptr != ins->the_null_scb ||
 		       scb->next_scb_ptr != ins->the_null_scb))
 		goto _end;
@@ -1656,7 +1656,7 @@ int  cs46xx_dsp_disable_spdif_out (struct snd_cs46xx *chip)
 		return -EBUSY;
 	}
 
-	/* check integrety */
+	/* check integrity */
 	if (snd_BUG_ON(!ins->asynch_tx_scb))
 		return -EINVAL;
 	if (snd_BUG_ON(!ins->spdif_pcm_input_scb))
-- 
2.48.1

