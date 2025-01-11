Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B15129A78;
	Sat, 11 Jan 2025 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562493; cv=none; b=sshoHGwBTIYEUnj5EEi8zX0WFM7yKrmTLo4r5TxhqOleyA1WRSNWQree7y+Yg9F+mWBJADmUUcRC22V4J3GDHNAJppKPTKjKMVprDofMZFLLe6BLCGUg+8MimgcGFow+udMDoo7howKLA6C9FWsFJO3snCkBHkz2kq1R6+WnLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562493; c=relaxed/simple;
	bh=BVn4qDAoSHYxgR9sxTnZr/3zzGBNLsaTttWNYqIUlbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErvwOymvOS0BlGJDEa7Vuq3+GFWA3Qr1/tHaFkGmsczC0LkNipek3T1T26gFAqYZh2Tk7dSkj5Nznea+m/YzqrXhM7UAgfRIPniuPsgCCyWqxKHxXUECCAELGkc6fR1vQ/ZhINwr95RIFiPTwiPCanAdJkCiJvYDP67N6KG9XmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Ekexy+7Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SoCL27rw; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Ekexy+7Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SoCL27rw"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5341C11400DB;
	Fri, 10 Jan 2025 21:28:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 10 Jan 2025 21:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1736562489; x=1736648889; bh=QMGnFvsjyyfRuhOFtczUK
	9uyXvigIaoB3JzteWhaOB8=; b=Ekexy+7YfN6EpDqwt1kqgppgZcuD1gV1cOpYr
	9qgVjMKk3znNm0h9sQoO0bfqyGmUR86UjiJvRXTy6V8L6QApvjf0XXe5I5G1B5/z
	v+R5icbwwrs498YpI2us+R7ll9cganUpAuBiFOWaauACqIMI+xXMNwQ6TcSBp4zA
	3Z1F3j0JkRL0BvT52SRsa/T3HYZqWhaRL16N42x52pNopOV8JMvuwNXZ97byL5PX
	TZEEgsDCImOh0ygWYhzuvIIZ4rUkqoBb0j0awQIHay9Ut0G8jpMmq8kLvKt8F/JN
	nAM8tFUKIjxux3lxASWT4MeFUGtZmtc6C7RkdlPjWa0sqt4Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736562489; x=1736648889; bh=QMGnFvsjyyfRuhOFtczUK9uyXvigIaoB3Jz
	teWhaOB8=; b=SoCL27rwFIeR+GQqadfbvAPLhvegsh1Bo2hoZCm+PgGc+R9Dogb
	qJOcTSXUm/aVq1LXG0jFhV00m9WhCSnaAo9sWWm3MCxgZbiXb81ajCYlJxbIrftd
	105qZe/8111pk/aue3BE78PauNt387+lTjKws5X6Gh5t5DZ14UmamDe3mqi7+1IZ
	e5HuNuAJvWFdBDWjXhPQD7XnTka3ECLYJUoP9nkHPzseygAfvEYV14NEhEthqPld
	o5Rb2Gey5iPE9KrCm7sVVXwPQ5jMwZhVgPfIkme43aQJ8WGCi1DA18Xb7h7ihXwd
	i6RLPlMwlyCvqgc2z7SoelBxFC2OrZQLhQQ==
X-ME-Sender: <xms:MteBZ3boJHFMoTueSd1wU1B91vCtIJimfTEZCY71nHTW_t7aS8ItrQ>
    <xme:MteBZ2YaTz4zyYCHw6K-wy33cmSmz38WdKRgnjgMJfBFgUydJBM6c-yvaOaBFy_XN
    BRghcTmsMr1EckdjN4>
X-ME-Received: <xmr:MteBZ585zlqQ9e22e58jNlc7gUpiE9TXR-R_5Ls6j6SDMqUQtGiscYc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegledggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdf
    uceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthf
    duudekffefkeeiffdttddvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvsh
    druggvvhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehtihifrghisehsuhhsvgdrtghomhdprhgtphhtthhopehpvghrvgigsehpvghrvg
    igrdgtiidprhgtphhtthhopehkrghilhgrnhhgsehrvggrlhhtvghkrdgtohhmpdhrtghp
    thhtohepshgsihhnughinhhgsehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgtohhmpd
    hrtghpthhtohepshhimhhonhhtsehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgtohhm
    pdhrtghpthhtohepjhhoshhhsehjohhshhhurghgrhhishhhrghmrdgtohhmpdhrtghpth
    htoheprhhfsehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MteBZ9rOCjclkwgClyUtghY2FNmI1l9paCPgs0AreMShaFACwmf8mA>
    <xmx:MteBZyqzrR4DJVtTmJtl5beHTb_xF9gkSz5O9bsZLX3TaNcG68mYNw>
    <xmx:MteBZzShizbwjtU54xs02YgklhvjFU-i2kyqVBQmqQKlCkDZ-g7RxQ>
    <xmx:MteBZ6rs1dIDd1D5e9T8u_E45OpvC4MKZKbIegoMEfx_mGxigKK4qQ>
    <xmx:OdeBZx1aOad-SLdpZsHLDydDQ4deA3hjkfJzsa5pt3pMBH8BgB3HK_-7>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jan 2025 21:27:59 -0500 (EST)
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
Subject: [PATCH 1/2] ALSA: hda/realtek: fixup ASUS GA605W
Date: Sat, 11 Jan 2025 15:27:53 +1300
Message-ID: <20250111022754.177551-1-luke@ljones.dev>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GA605W laptop has almost the exact same codec setup as the GA403
and so the same quirks apply to it.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b74b566f675e..f829ac992619 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10641,6 +10641,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e1f, "ASUS Vivobook 15 X1504VAP", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1e51, "ASUS Zephyrus M15", ALC294_FIXUP_ASUS_GU502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1e5e, "ASUS ROG Strix G513", ALC294_FIXUP_ASUS_G513_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1e83, "ASUS GA605W", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1eb3, "ASUS Ally RCLA72", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x1043, 0x1ed3, "ASUS HN7306W", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.47.1

