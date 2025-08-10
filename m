Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB7B67A
	for <linux-sound@vger.kernel.org>; Sun, 10 Aug 2025 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754794926; cv=none; b=jlWRcMSxDsZxi/OJ4jy90hX9MNEapf85euyHzWJnvpm/ZPsOp2r3o0gBGqduTHfYHFIQnE83GwFdsqWqbcqwYMdciy65NHInB3XpBLAwZxn42igkXNWDobeExStjXCQl9z0kNk2gQcuJarzFa00EKLRJvsdByB3w7uwpBtry3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754794926; c=relaxed/simple;
	bh=k+h+Ny9sD1bkhVviYe9h2y02q2ldEvtGORlkHAlO59k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PfyM0oH/VN85AetKhJOwBpntbyfYTu8eRJaJUeTpRTpkjzYaWAVYZGBhZ8OZmEfiTCR+dt6/jeu1UUWF7ow7U7vhpJbuft3PVFxLXahSak/jXUuBV6Db/dj5wBxMRIUKCOKAAD83to0m6EZvAAHG/dzjWgjxAFMO7sJHKQMr8n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kreed.org; spf=pass smtp.mailfrom=kreed.org; dkim=pass (2048-bit key) header.d=kreed.org header.i=@kreed.org header.b=iDuLs2Kt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J4+4VbxL; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kreed.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kreed.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kreed.org header.i=@kreed.org header.b="iDuLs2Kt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J4+4VbxL"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 21A9A7A0051;
	Sat,  9 Aug 2025 23:02:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 09 Aug 2025 23:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kreed.org; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1754794921; x=1754881321; bh=y7ennVIW+3E+PEtU68G3B
	LtU8W2CkRAL2GmLNln5PH0=; b=iDuLs2KtStyNni6+Cy4+ba+PoSoVxs8T88MsF
	bYlZ/G8L2NIrW38o2QOzjHbvvowOwYRkY7Al0lldz44s2eG9tQRFRsDjrwwJCLUc
	SWVTYQQDJ7YVzO71WqJwlVNif9Sldsn9qnCg8IP4ogu46myfP+yCqLGikk9CM/mL
	xmL4Ay/ZTbfskh40cgp3rUwGGqCxevwpnHh84K8XtRYo0udzdDNAxRw6By28lWuO
	ROx17TNoUZXPDYezCOj97ufOFAiNBXeeTn5JhE8lpTm2JTNnGEO28EMRAgOZdNB6
	QpL9k+axOdClEEPozO6Ji9RWf8377HA1V4eNeN0NsFrnPlncQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754794921; x=1754881321; bh=y7ennVIW+3E+PEtU68G3BLtU8W2CkRAL2Gm
	LNln5PH0=; b=J4+4VbxLO9wscTHKoUOPDM/PNfIiJh+tqZZgjGaUdpQym8KTg0I
	t4mNgkTPKOmbw4JuHXt2tNzjeD+bibv2Xb/GKxiWDRCHL4JEd3h7sxoikaik4Xpa
	amW9EPPvKqyFu5ZvGEjB9IJwaZqwOeIbLepaACGJ1OLqpXQ2axQForRMdwXOAyA2
	Zx/9lkbcw8oP6M+3s9uXoWkKezekY0PNfRTodnjDDKuSfLtxz6pjRQZoY3AyaY7z
	krHn2JMi7d3bR3PnBYiuxYtlB3FIxGEhKXe84W+b/gp6HbR9CFE1rzg50p+xCYWc
	tdy/FAGna7GH5RFmP5iHGuaaoFuBOYo5PRw==
X-ME-Sender: <xms:qQuYaB5vRzRiwG-1NLCJ9cAc5hNbcySBz0UrgpAYDKsnB8fFqEpZlQ>
    <xme:qQuYaJdR0VF4LTFsbE6CH5ug0bi9NdXJbH8F_8IKpCxfLmgDkfIQYCtuEdmN9PIpR
    gt921qQnAy8j6Fw0A8>
X-ME-Received: <xmr:qQuYaFB1weciWQUqSUSOtCGpTb1bWEXuRjsK3cB8_7AOwgcLv5Vzp4Qv9sIxEbyVpBv9CuRz20SD5SYTfhLvIPneDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeevhhhrihhsthhophhhvghrucfgsgihuceokhhrvggvugeskhhrvggv
    ugdrohhrgheqnecuggftrfgrthhtvghrnhepieeuieefieffkedthfelvdeutdeiffeffe
    efhfelgeekieffhfehuedugfdtheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepkhhrvggvugeskhhrvggvugdrohhrghdpnhgspghrtghpth
    htohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqshhouhhn
    ugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtihifrghisehsuhhsvg
    druggvpdhrtghpthhtoheplhhinhhugiesfhhrrghmvgdrfihorhhkpdhrtghpthhtohep
    khhrvggvugeskhhrvggvugdrohhrgh
X-ME-Proxy: <xmx:qQuYaM8Ixq9pjMpY5Uv8lykWZdBpuwEZm7r4NTUYCWw5R8XzzsxGQg>
    <xmx:qQuYaAIIprIjZKZ7ZBdTteFRwRVSBmE7AqBwR_Zax_GZKUbLErTYMQ>
    <xmx:qQuYaFhIpuE7t18CNNZFMcjRS36YiKDCziUxyuQXo0oqsN4GS7WSnQ>
    <xmx:qQuYaA7EGJXW1WVxQE079dhh4f7YvShwFj4kc3_WLp8noT4F6MNy5A>
    <xmx:qQuYaCdfEfQpTxvPkrWce2hPfDHKF-ZHOlaCndx-jETDUvIUB0S3SjLC>
Feedback-ID: ifbae4884:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Aug 2025 23:02:00 -0400 (EDT)
From: Christopher Eby <kreed@kreed.org>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	linux@frame.work,
	Christopher Eby <kreed@kreed.org>
Subject: [PATCH] ALSA: hda/realtek: Add Framework Laptop 13 (AMD Ryzen AI 300) to quirks
Date: Sat,  9 Aug 2025 20:00:06 -0700
Message-ID: <20250810030006.9060-1-kreed@kreed.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Framework Laptop 13 (AMD Ryzen AI 300) requires the same quirk for headset detection as other Framework 13 models.

Signed-off-by: Christopher Eby <kreed@kreed.org>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e27a36e4e92a..337e33a59de8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7158,6 +7158,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x000b, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000c, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
-- 
2.50.1

