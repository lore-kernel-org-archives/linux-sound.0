Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6ED23AD
	for <linux-sound@vger.kernel.org>; Sat, 13 Apr 2024 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713040296; cv=none; b=FDwoA48vZ/pTPm/MSfHQkqMaLBvJRKOZcxyNI+f9X2BsLyMLJd0yOmZI+jbBh1crotN5wb22v7S6wI04QC6qpEp/0ORk8T6gqag+lg0BzrtmmkzblwmedXYivWrjrXdJ0k2Xy3j5MfB+ikcNjF7CWN9+f/SfB+Rx9BcPljEXFXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713040296; c=relaxed/simple;
	bh=2e5uN1LHyQJLIVOoslS+kJt72qpJTeDURUYr7NmaKz8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=Oraiq+MJMcPDpLYu9il9UESnievxylgyf/+IffBjXaORjIz9R3QTpBsIJG4sr6wf5AI55joNQ7FZ4dbBQ+y2JnObQ0X1Irz/lZdKC8pf/g/zAUYjmlY4j1QFr3/QCyIq2V5gds56jC0t1QPTrxB3l/m7/M52WmF/qcV3ljiLcGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=qNpUk/H8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MNCnZm1O; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="qNpUk/H8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MNCnZm1O"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 59DAE1C000CC;
	Sat, 13 Apr 2024 16:31:33 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute2.internal (MEProxy); Sat, 13 Apr 2024 16:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713040292; x=1713126692; bh=HMYjILLf+Y
	y/b60sSH+JeHE7ikLcz0yuwtpFn+1j58s=; b=qNpUk/H8U4fQA7RfMQqdv2ZOOa
	vZuI9NzpVwPcKJRacsnJBOz9nfiPaywn2Spbtp//cEPKSpyTwfoDFgslmbv/8/26
	psz/WjVhlrpk6HO8FJygrsbUVrnl9q3dp7boV8ilBKdjkMviJ5LE8kRcZ1Fi0Ueg
	JdPuM4gusbpqsOWHXnZpfXr80Xke3Thm6BBKQozDT0u0L/BPCkze3hr9QDbbATi5
	fZwCj+kbphr+Gcrafh+df2ChnBPGWYRpZ+pN8hkAA+/Vu/TilwjkFdQts8tRqgUa
	AUvCkG5t8i13OUPq5WL5BRwyyn6kP6r3QYhuSKj2pzcLQKqcR0/udxu7BVlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713040292; x=1713126692; bh=HMYjILLf+Yy/b60sSH+JeHE7ikLc
	z0yuwtpFn+1j58s=; b=MNCnZm1O3kAc67qXYwjcYhXUuGFUnEmOK2TlIPbDyHar
	IKS6wywcuoTcrYGAJFUxtkj+/8qpk8uJf0693CGLEoZB/MUa1JACNUBjNtFsK2sa
	CNm5Tbmm9RYTIXg5B2Sui17tXKkS+g5fBedcrq4QyQxRHk8h94QU9PvsMcmg1ghe
	se/n2KPPX8xie7xVKVc/edjcOUPNw+LpYQpDnTMCeFouE5498q8OtiTkzIiw3P7J
	o22XU9owFFwQEKhFYqNz8sjNyBiNfIBaShTKHmFy0FEx+u0wnBNE8jbBJE4aSXz9
	Qe6RbPMBdJmyZs9+boNtuKqlQCybeTQGccnUN5GLQQ==
X-ME-Sender: <xms:pOsaZrM9IV63xwbRSPQCn1fqTKr5u4vOd4hW2KDC0SZaew_b0pW5wQ>
    <xme:pOsaZl8zkFSuRoCMmagqpn9Eu6wFuWDKkrl0vYhBcukWV1LU_Iu_9hHMSW2YgChSG
    KmjNiCChRmNi-LSip8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiiedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfnfhu
    khgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtth
    gvrhhnpedugedvhfelheejhfekvdeuudekfeefledtueegvddtteffheevjedukeejleev
    tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluh
    hkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:pOsaZqSRgUQopkTboeKHxyZJpc1qAMoQXkNUKW8W1bpVQEajudG_jw>
    <xmx:pOsaZvvGF1Rg7J9Ry_QCfJfMFEM9QhXYfw1RYNjhZbz0IpHx3rkYmA>
    <xmx:pOsaZjf_jIAEfGG1UcFQlcaXXS57mdLVS_Wjj9t8dvXtAoHN4N-DnA>
    <xmx:pOsaZr2w7uJww3F2TDh33Oo22nGSdIYMOojZBIPOKEQiMky3fw8f4Q>
    <xmx:pOsaZrGWRF4kTnHy_8RcI4Vkwja9mVt4xLPGUSFPXvTw61k37kHLw0IF>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5FE162340080; Sat, 13 Apr 2024 16:31:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <27820538-b63b-49b6-8bf9-532036f30258@app.fastmail.com>
In-Reply-To: <20240411125803.18539-1-vitaly.torshyn@gmail.com>
References: <20240411125803.18539-1-vitaly.torshyn@gmail.com>
Date: Sun, 14 Apr 2024 08:31:12 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Vitalii Torshyn" <vitaly.torshyn@gmail.com>, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH] sound, hda/realtek: Fixes for Asus GU605M and GA403U sound
Content-Type: text/plain



On Fri, 12 Apr 2024, at 12:58 AM, Vitalii Torshyn wrote:
> Added the correct pin table for Asus GU605M and GA403U, enabling all
> speakers to be controlled with the master.
> Updated quirks for GU605M and GA403U by including the pin table patch
> in the chain.
> 
Co-developed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>
> ---
> sound/pci/hda/patch_realtek.c | 40 +++++++++++++++++++++++++++++++++--
> 1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index d6940bc4e..4544b5039 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7467,6 +7467,10 @@ enum {
> ALC285_FIXUP_CS35L56_I2C_2,
> ALC285_FIXUP_CS35L56_I2C_4,
> ALC285_FIXUP_ASUS_GA403U,
> + ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC,
> + ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1,
> + ALC285_FIXUP_ASUS_GU605_SPI_2_HEADSET_MIC,
> + ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1
> };
>  
> /* A special fixup for Lenovo C940 and Yoga Duet 7;
> @@ -9690,6 +9694,38 @@ static const struct hda_fixup alc269_fixups[] = {
> .type = HDA_FIXUP_FUNC,
> .v.func = alc285_fixup_asus_ga403u,
> },
> + [ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC] = {
> + .type = HDA_FIXUP_PINS,
> + .v.pins = (const struct hda_pintbl[]) {
> + { 0x19, 0x03a11050 },
> + { 0x1b, 0x03a11c30 },
> + { }
> + },
> + .chained = true,
> + .chain_id = ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1
> + },
> + [ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1] = {
> + .type = HDA_FIXUP_FUNC,
> + .v.func = alc285_fixup_speaker2_to_dac1,
> + .chained = true,
> + .chain_id = ALC285_FIXUP_ASUS_GU605_SPI_2_HEADSET_MIC,
> + },
> + [ALC285_FIXUP_ASUS_GU605_SPI_2_HEADSET_MIC] = {
> + .type = HDA_FIXUP_PINS,
> + .v.pins = (const struct hda_pintbl[]) {
> + { 0x19, 0x03a11050 },
> + { 0x1b, 0x03a11c30 },
> + { }
> + },
> + .chained = true,
> + .chain_id = ALC285_FIXUP_CS35L56_SPI_2
> + },
> + [ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1] = {
> + .type = HDA_FIXUP_FUNC,
> + .v.func = alc285_fixup_speaker2_to_dac1,
> + .chained = true,
> + .chain_id = ALC285_FIXUP_ASUS_GA403U,
> + },
> };
>  
> static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> @@ -10145,7 +10181,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C_2),
> SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
> SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
> - SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U", ALC285_FIXUP_ASUS_GA403U),
> + SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
> SND_PCI_QUIRK(0x1043, 0x1b93, "ASUS G614JVR/JIR", ALC245_FIXUP_CS35L41_SPI_2),
> SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
> SND_PCI_QUIRK(0x1043, 0x1c03, "ASUS UM3406HA", ALC287_FIXUP_CS35L41_I2C_2),
> @@ -10153,7 +10189,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> SND_PCI_QUIRK(0x1043, 0x1c33, "ASUS UX5304MA", ALC245_FIXUP_CS35L41_SPI_2),
> SND_PCI_QUIRK(0x1043, 0x1c43, "ASUS UX8406MA", ALC245_FIXUP_CS35L41_SPI_2),
> SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
> - SND_PCI_QUIRK(0x1043, 0x1c63, "ASUS GU605M", ALC285_FIXUP_CS35L56_SPI_2),
> + SND_PCI_QUIRK(0x1043, 0x1c63, "ASUS GU605M", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
> SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
> SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JU/JV/JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
> SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JY/JZ/JI/JG", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
> -- 
> 2.44.0
> 
> 
