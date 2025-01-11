Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BBE13CFA6;
	Sat, 11 Jan 2025 02:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562502; cv=none; b=KMaisa4bYN4YxCg64rOUbKAFJW9FEQg1vCJJPcex7XTgo0uCXHNKjj7EEWQidlkTqFi/HTCy0mVxTuaxPa95Owu3K83rhKS5X4vGyTUdbAJNQWK2iZ/kGXqwh3033Si7AjgcSXeV8ZhQxh3ZLMaiKduvqoUtW6lzGWltk3hJx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562502; c=relaxed/simple;
	bh=1uI9NZJxuv/gx8fZ4a3adXGqGlKQZQ/xKanPNBl4G2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYhh4XBJFhK6p+MAFGau5924lP9AiJZuRVNSgtboqCew93YCb2KRRDuYZsWxyoWuvOR3JT/0FsX5tVYwirSRKDCeo7Ju0k0l/1iq9BT2prwv3KxWJtY3W1tKXYNmFjEdjWPsHnC4MHdTVV2wmEXopYyimkcfmKXeBpw9QITdmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=td9OZfvT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WOmOxbYe; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="td9OZfvT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WOmOxbYe"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 75A6D1380143;
	Fri, 10 Jan 2025 21:28:19 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 10 Jan 2025 21:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1736562499; x=
	1736648899; bh=4kP9DtczP4dYSsdkZRTGJtkQ+MUxMw1Xv7mG8zpSDwY=; b=t
	d9OZfvTPbzK8yL+g+h/t+Yr5GbtxKE/BuYmzN/Fbj4jOrjsxBv5ofcj9siK4tJYY
	KXa9rMRCek40s8O3CeBvWXNeDV95GKeJKtnb+anNEGquvb1z/sKWgL26z+CdpnXN
	WCHH6NanIT70I4+AYPOHqP3HHRU5K9lAwWM2kVjZkSV95/QxE6Ax+zDOnkCvMrZc
	u7bE0yv4tjr3L1JKy/JLTpkTdpBx6qIYQ+H2rTS02aJLrulWT9aDiP02rGzllADC
	44y1ZThbNKZc69rjvM5nFYGvwTwp1jrgoQi+sH4wbKp1w50USxRzbsbfeVFgvXND
	8uYQbGxC+BwRwuliu86zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1736562499; x=1736648899; bh=4
	kP9DtczP4dYSsdkZRTGJtkQ+MUxMw1Xv7mG8zpSDwY=; b=WOmOxbYeNxvpSb0Gb
	rIEfMaBmZ77I5UccZu4P0l1XqAcdnUdYOPxLw+qK3NIH94UbC91xfIVPObFvxkXM
	iKBYKVyDurPzSLayy/Og0gQN7V7myUagDKCehNMKzk0r6Uh1pfa4ys1WPAyw4WcT
	LmLzp4RaCQZRccFLYscTG8MlzZ1FT5iZHgQ8HIIlidVAV/rumY9qYe59s+kvHaYG
	vUDkAfJ52Zm/Es0Mi1xIrhO8SihMniMc9HvoIWzyWId5odsXlFGgD9u24fJX6ee6
	vQ4jAinHvm9jCasuzFhim88LYXbaCdiut36myVFSi7xg37Qwd7c1BiAkb2hkYh6T
	DCj9Q==
X-ME-Sender: <xms:PdeBZ7U8l7h4t21sa-5phPLvbmpPKfx5bAmV7z_qVrsBdAY_41wnUA>
    <xme:PdeBZzmTwa3brhD6HXFgoXbppua-Km-j71dbJ5FxVuIVVF1pTtveBdmAWJ2JMEAvZ
    D81nAL4tk2dOsJkReI>
X-ME-Received: <xmr:PdeBZ3Y9nQMfwLSuReUt6bJuK_cQxV0VjFDHiRTL623G9PCkpJfQ3x4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegledggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgv
    shdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfe
    dugfetudeuheetjefhuefggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonh
    gvshdruggvvhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehtihifrghisehsuhhsvgdrtghomhdprhgtphhtthhopehpvghrvgigsehpvg
    hrvgigrdgtiidprhgtphhtthhopehkrghilhgrnhhgsehrvggrlhhtvghkrdgtohhmpdhr
    tghpthhtohepshgsihhnughinhhgsehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgtoh
    hmpdhrtghpthhtohepshhimhhonhhtsehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgt
    ohhmpdhrtghpthhtohepjhhoshhhsehjohhshhhurghgrhhishhhrghmrdgtohhmpdhrtg
    hpthhtoheprhhfsehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgtohhmpdhrtghpthht
    oheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PdeBZ2Wb1hACwNIibnXwVBxIxfYRoxgSrPxxK1EiuIL-StkMSsHbaQ>
    <xmx:PdeBZ1msXA4iXXSZu4bTnMNcFD4BTiiBPzDSQSCv3tak2iltfGa63w>
    <xmx:PdeBZzf0P_Feq7Xozauz2lsWyhYxhd3Ek5mm4x59EmajZ75IULD0CQ>
    <xmx:PdeBZ_H29XTuTB-8_yYaTwitofnGF0REWysFaPiEFmB_V5O_V3hEiA>
    <xmx:Q9eBZ2hfjVp7K0mAzLCx1K4RYNk8AF1Uu5vg6sDbujKgcN0n2GnoRhz0>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jan 2025 21:28:09 -0500 (EST)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Cc: perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH 2/2] ALSA: hda/realtek: fixup ASUS H7606W
Date: Sat, 11 Jan 2025 15:27:54 +1300
Message-ID: <20250111022754.177551-2-luke@ljones.dev>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250111022754.177551-1-luke@ljones.dev>
References: <20250111022754.177551-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H7606W laptop has almost the exact same codec setup as the GA403
and so the same quirks apply to it.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f829ac992619..a2f9979c8801 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10641,6 +10641,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e1f, "ASUS Vivobook 15 X1504VAP", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1e51, "ASUS Zephyrus M15", ALC294_FIXUP_ASUS_GU502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1e5e, "ASUS ROG Strix G513", ALC294_FIXUP_ASUS_G513_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1e63, "ASUS H7606W", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1e83, "ASUS GA605W", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1eb3, "ASUS Ally RCLA72", ALC287_FIXUP_TAS2781_I2C),
-- 
2.47.1

