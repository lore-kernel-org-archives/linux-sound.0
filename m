Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831BB7710B
	for <linux-sound@vger.kernel.org>; Wed,  1 May 2024 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714563301; cv=none; b=DgO38g9YCg95Z7yRdLt023bWCq7ehYs/nokI0Lq46ZeKe+hAC/WSdc8AKL3/5gGvbl8oIc+yD1XzxbUJy8VbLco1+sRU4Dnd+g6FRqqTbStzXev05gjLgkcp+BSKWhwnebc10KNbuudX+W7WibDavop3E5Lq2APpIvpsSdBQKoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714563301; c=relaxed/simple;
	bh=clRmPP+Lh6DTEqIsrsmlbmlAn9lh+ic9hChZkPuAU7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCSHyOm/oU6V1O8uaTntEwnZnqENcodmVIOZfn1R035s0zPNZChct2IkeG0BDkTddxmEFkkflEiiaNwc0mdP/n4T8jDFd78HiFOYnVRxNGTleegPscIioQ6ATNz3et1vGuEsvuDhiwvDqTO3YM8z/7IAdBYu16imN170jVehMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=YgG2ifVM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gt8uC1Mo; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="YgG2ifVM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gt8uC1Mo"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 874D51800129;
	Wed,  1 May 2024 07:34:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 01 May 2024 07:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1714563298; x=
	1714649698; bh=MzVTgSIcQBRJCFrmXjcjXf7aajLrTbQh0WvfEoGLBas=; b=Y
	gG2ifVMQucVul6s0NMsB8fUwuv7PmS0l234JteuEtlhmK4cLvK8nw/19xYQqrFWi
	7qKowrFDEBjpuFzQLCCFBvSyqhZp4KwY8ZgJyXrin29C915tqOBXI5FmNhEI6NoT
	rj8U7x1A9DXxFOhunvtJbuC5Khvx7gvzf7fGX6ihpqNxP0+YEBGGnJD3xvseSsun
	f0xnCqiTkwrYfxJ8CX1ILgvOpODagzdlA14xeCV1T7W4vj624LlF5pXXxX/8NIgL
	6Vzj9HivODHmBgwYG9CC5NFcBZbvZ/HfBwUiTffeiN0O5PyUJsuMuwpkXdXxmm9b
	qxkV2G+Q1XzslSxOrPWZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714563298; x=
	1714649698; bh=MzVTgSIcQBRJCFrmXjcjXf7aajLrTbQh0WvfEoGLBas=; b=g
	t8uC1MovAyJSTfn+gbvMbbx7ljo0YLhfBU31Z0cH69f2p0fMyn9N7ZcatDnduuLI
	jRUfz6Bh5I9FiG9DgQP+wvKMn0xe2swyic2AelsxDAEMRaXgPYsI+EvgsaIC9Hyr
	op/Fdm01z7GEiNRWB33B8iLFFw6OLWXq6FMgGOqWXCBe/gbvtVSMfmjX+b2DMJ0D
	URxQR4nlZEv9ny4y7sWbFestgdLJ0ucYi4ovMosNxNagOV0b+xrlKCSXTCwCsWlu
	mwpaxeqRDaqbvrOJYoylaKnakv/fHhVmJFo44pBQeXVksWnv6mhWKOPN/msxKhiO
	BhDPhoS3di+r/YKz2ganQ==
X-ME-Sender: <xms:4igyZqi-VYDeQgAS231nUxM1RB24Tnnsq61oQWT74KpR9cBpXeHj-A>
    <xme:4igyZrA5o2iCLiZ6WxjyxDT_xi7-4RB_EaHYENyAPLLdb1xWev-vZpD-seQmZhMuF
    LbdXGAiI5mR6r69xOk>
X-ME-Received: <xmr:4igyZiEI9PhqrrUg-jRkYO4v07uFmitaIetzc_zsNhnkMU2E88C_cGLTpgzwRwiX8IoxzwVtAKgIBWldhO5wL4D5lSTcZRAakj1gRtin7RrmAqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduhedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:4igyZjSIhKC5mE_NKnHgBxtGw62LL7ZIN2xUWqMkCwNgI2cN3sjTwQ>
    <xmx:4igyZnx6AE9cmex7beCmHZoZ4muE75ItQ6RN-xzer_p60HaNoDXeww>
    <xmx:4igyZh4rdgTf8Y7GVwXDjr0bmka6E0LF1ZMXMm_MHTmA7bSrNYSjHA>
    <xmx:4igyZkzhUkfmbjoqc6uMtdSa-hkzIqZcEOlTrDApYcU2jvJ_HlndcA>
    <xmx:4igyZn-WAbsGdnQDaOt-gEb8RysRpuzsxgdnJVdrV8NNAdB54UMDcf_P>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 May 2024 07:34:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ALSA: core: delete sync member from snd_pcm_runtime structure
Date: Wed,  1 May 2024 20:34:44 +0900
Message-ID: <20240501113445.100817-4-o-takashi@sakamocchi.jp>
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

Now no drivers use the sync field in snd_pcm_runtime structure. Let us
delete it to reduce the size of structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/sound/pcm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index dca5d2177e9b..3a05ebe51f06 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -401,8 +401,6 @@ struct snd_pcm_runtime {
 	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
 	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
 
-	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
-
 	/* -- mmap -- */
 	struct snd_pcm_mmap_status *status;
 	struct snd_pcm_mmap_control *control;
-- 
2.43.0

