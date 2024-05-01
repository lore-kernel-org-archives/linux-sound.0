Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E664A98
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563298; cv=none; b=LD3UcoTNcMVRl2Wko42CQcOjKtFe1oNrSxPrKU5ifnwY1So1noJTeSTOwpGx/gIfmygEzb6B+A3xw+3M0IkCC8to8AAxaC7ManUFr5h1eoqSSd9tDbG66lj8oRfUJswFhnZKQf10HhDsOOdJekbO4K9V8XXlQ2S5/Pg0y7VWg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563298; c=relaxed/simple;
	bh=/r/zo5E40fyuMXYjMXhmjEXSarva7roM6Zkfy937I14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2UcIpoh/ug1syQK5PBAhaf0DgkDHT6nK6dkG865Izs1D5i8jBNT+HfrWZ5k7enIG6tQ1L0JPoN29H8Dn3lBvonsdLTDZ+5gnd6aVEBlpTDx0hEQcslQU4WyyejmlWng1TIN6eSFburDc/Ih3kHjI3aPKFJWu5GO/Kdg1veMzzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=On0DzGX5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=anwIv0ME; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="On0DzGX5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="anwIv0ME"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 1EB4F1C000DA;
	Wed,  1 May 2024 07:34:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 01 May 2024 07:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714563295; x=
	1714649695; bh=A4T68CeXZo2TkAtB/lM46tflbKcikcLA/u8h+xuY3AM=; b=O
	n0DzGX55wjViy9lKmEgkzqQ/46nkGNVWS3uhPDXix2LIxMDhxVO4yf1kj0DANaBg
	mFE0Rjr15sceiayOY866c03a/rImTZ+aPVNVCtLFQor9Y5alyYgVM03rNiRgBYGN
	NObLOc96DNCi2O4IdOfPULMHtkZ4cs+2/EYo+4CXRnfwk86/oz/WK0XrMkBbfmh2
	rsvnefpsVejterdVrSt7KayT4kJB8Zg1BOwpYVBBhNvBoR9xw8Mx6/D9DEuWOESq
	8+22vEe/L/uQDcfVjLE21AdQZ88pGPX4nvyEucrHTv2/45CWIHmUuoubtTGO+93R
	DNN0Rw9stx22fhJeVPiBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714563295; x=
	1714649695; bh=A4T68CeXZo2TkAtB/lM46tflbKcikcLA/u8h+xuY3AM=; b=a
	nwIv0MEuG6pG1XAfH5ph3uWAu33N9t1zHapjOx2yqsY3Vth1j7k8RJloorgWl8T+
	uf0hYbBhXSMWlJH0krmiMAUimDeeV3HhI6QJj/IUoY4VLvnEAOuKWRU6Klz7vTeL
	N61pTZR8NN+7rH5oZerdrVwFXS+1VLRHhj+0moThTT8WcXwJKZyTg3myqStkcx+Q
	lTzTyjIOwMP0mJJoSpStWflCDv/834QbH58BsQTnfQIr2IvEpETsvsgbjDQLDFiN
	q7Hw4Rx5odp85xfKRSo+Q4F9QesLqhisCoEyj+SUAVBn88n+iMHhuJXWR8cNp4ya
	petS52C8atCwL8kimshag==
X-ME-Sender: <xms:3ygyZtoNfqwgrx78MqkrvDnLBmpVSCeCnGeD84oHc9iznZs9VBJQig>
    <xme:3ygyZvrdC8vFVrGSuhCU1J3xk0eFq1HFYDtkKDmQcdbm9rDN7jVoZjk8ZLWin6FkQ
    UaUWGh8JrW2nx6UHiw>
X-ME-Received: <xmr:3ygyZqN3VIMOfS0vWBz271Uw4nOnOdDMF0zQJUvfbhgF2r75LyZdDh1N9IH6DFRbmf6Q_ik6XsITNk5OMqkVn8luAk3L8lBqky4W-8tEkrm7IMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduhedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:3ygyZo7OmrdYPIa5Cy7OPmbvwDucj5ciK47Gp_lM2YF0-PxGDEQfHw>
    <xmx:3ygyZs5KqQ30cB_MtrbY3bICPXpsLP04FL4yIA6Amwg6FFthyJl9QQ>
    <xmx:3ygyZgiKGAW_XVF9tEMCqneTB5frttLSmmoCMTEaOGz_UzDnyxf_Yw>
    <xmx:3ygyZu6Gc9kXXj6lqdPfadxM6rNUqnkHC6x_6CHXn7QrbqV5F1fUVw>
    <xmx:3ygyZqkotbZxJky2ZLbcxlEzBvWIvArbCg-j7E13iQMzS4nu-A9n5IIM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 May 2024 07:34:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ALSA: pci: emu10k: delete usage of 'struct snd_pcm_runtime.sync'
Date: Wed,  1 May 2024 20:34:43 +0900
Message-ID: <20240501113445.100817-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501113445.100817-1-o-takashi@sakamocchi.jp>
References: <20240501113445.100817-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Linux kernel version 4.13, the data of snd_pcm_sync_id union is not
exposed to user space by a commit e11f0f90a626 ("ALSA: pcm: remove
SNDRV_PCM_IOCTL1_INFO internal command"). From then, we have received
no issues from users or developers for emu10k.

This commit deletes the usage of 'struct snd_pcm_runtime.sync' from the
driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/pci/emu10k1/p16v.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index e7f097cae574..86ab86d1ec2b 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -170,16 +170,7 @@ static int snd_p16v_pcm_open_playback_channel(struct snd_pcm_substream *substrea
 	       channel_id, chip, channel);
 #endif /* debug */
 	/* channel->interrupt = snd_p16v_pcm_channel_interrupt; */
-	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (err < 0)
-                return err;
-
-	runtime->sync.id32[0] = substream->pcm->card->number;
-	runtime->sync.id32[1] = 'P';
-	runtime->sync.id32[2] = 16;
-	runtime->sync.id32[3] = 'V';
-
-	return 0;
+	return snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 }
 
 /* open_capture callback */
-- 
2.43.0

