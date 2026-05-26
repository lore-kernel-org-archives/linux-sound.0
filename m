Received: from fhigh-c5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20D327AC45
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800886; cv=none; b=HmzhVe+RzmUtdBAqaN91tDkm38WP2tvnaCWxAuwcE0cX7eXoyNFSCGiwXG8MOJnnLbBOEqSzaC6jAszIcwR7anb4/6VKljPLIfhBjrtBIRNQi6/zRnd/nSsMKLghal/rROQ9IR1iyR/b37V3TROrlHRURYDQzsX7eTOr/Qn3Xn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800886; c=relaxed/simple;
	bh=9jEZbG5BFlDPJ26oe32JMl9RRNrcOL52l9eChmRbOW4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=m98CNaPd0MhXudxvjMMQv8wHMnSuMQhTqwaEdkcSN3nFcDwn9XOtRI7rJHvRMRsK6r5vT2wVbtPHnFD0SER7QwPRfsd/jVETCwuTb5qwoYXKFlAdonG9MAMuKLrA0p1QDOxvoS5TVn/rAZMDI/tVNk0BQu9zQVtQx31FE2KGsDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=oH1/dSwk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XWDHdhXG; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="oH1/dSwk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XWDHdhXG"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 020737A0165;
	Tue, 26 May 2026 09:08:03 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 26 May 2026 09:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1779800883; x=1779887283; bh=py
	F5uxz4RkLAT3V+tiZgOE1Rw9OuOFvu+VOssPg0Yg8=; b=oH1/dSwkbkweYlOej6
	A23CcKxxZ4KG3d5HO4tnJAhyfpJDJOiAFABzknPSCZpFALMPACMkm7baPOQQyrHz
	bDEtvL5dw4VcpAtkbm0ZvXJrW8KpJrRgFO2TiHDGVSoHRkEr10LbusuxIvt/mp1I
	aczJn+WLNi7TLhA0NdEHIvtu5ktwcA1HqaSJQ6mKETN7f7cqY6QuvOrJ3M8fATSn
	/+5l7ueHLGpDxkVcTLZj4Qk8NnUJhAA0bL3fVS1bEquosvHoQgJ2hljRqSNg442e
	vWdc0GE3wEy7hFb5A9Dzepa9vKopcF3YQ6jRcnF2qyM3fpC4b8CXZXk35PzoUKVo
	HHKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1779800883; x=1779887283; bh=pyF5uxz4RkLAT3V+tiZgOE1Rw9Ou
	OFvu+VOssPg0Yg8=; b=XWDHdhXG/aWzPiVKNd+uftQzOcM2MmbZh+h37n5kWK47
	uP8NGnEoBkVJuqG+JqTew8FpOJLvG2xW4n2AQ3M1tpe7VK2YhhkaabkwZb/LJh8B
	4+OPaFfU6BOS3vYOetPQX+j93A0foaHIOrjpQ0n6Jgu/We/Nviv0Xndf2ZZ7ye7P
	ge/4j19ml+zt05VrGm9SBh1JuditB6iScXrAqiP/dfTfSaEbpKnZ+4XJfCHFptCx
	kOO9YX9HR1vVnA6B/OBNEqOeJr7er/e7nvR00MW2u+ZgkaHLKAxhSrW8cYCaQXfn
	thgve7QHPdd5Q4oC7NeNoHCIUkOhqrceEjEGSi6gtA==
X-ME-Sender: <xms:M5sVaryXW7ISKaL2KgLr8mDgw5HmlZJMWsnVgYTVnE_YAHrCYQwbVA>
    <xme:M5sVauFWMQCv1RI3nEm-LD0EJ3nw_xaccXp64z-utgplJ0LsIOC8JT9lHco65Nw9g
    nfTSuKsaIv-RopROft7x4vWp-sIbSf8WRwwvh9VT4xSM6CNv_mR3gs>
X-ME-Proxy-Cause: dmFkZTGv3LIH+WrebXZ+WGpxMmkb8KpR//2gMaqzCJfkXFPdz4j8s7gvHHm3U0gvo0fr10
    Za3cBqHHmKyN0DMYGXnx/1U5NheAarJdLJruPEj4gbSVhMi2MCgiLQvrZg1CCkmnGr0A2I
    BUUNoOw2o9tZD5pCF2ec0Fe0JIKpH6i9HA+FumhTfrkdd6QXQF6AJPlxGo0WtXNrQFsdau
    9z8Fvwa2/6g4xVXfoMhXSOFrOAWAQYj5bDk/qhbc+GNF4BWk3YG+rHPiJ8CyNKnqSXHlvS
    fdt0nggR8m54+XDAjxHI+gXRPnGXo8MKKuGla2opxuAXe7DR5c1Uewf5+X0sG/RGFPSXk1
    m6CxPI+kfTFJzJ3KRyEvSlGTnJH29+IyIM/0bRCjWJfFeG2sMtvWHSWJV60BgQgx7KXefj
    eD59lvePsq/cU1kyCkvHaTj9gnYrobQDBBcIY054Y9oyMyURjlbLZco1GZ0y9SYlKOx2EV
    9ogKvaDXNBVSLqnLzvxbSNboLwXbgE4ntUikiue8Z/KdcSmLIRijf7b9Y6200uBGUH0lef
    62hqO0a0ptK6Oqkjj8dPOdbQq2wVT2X/Ahsczjy4g2Wj2z43UamJckX52I6V3pJxjW/S5z
    yR7TNWmFSSnGfSliy3svCpGb5ODvBvojrzfoBv62G4DuzL41g0L/xf25f2yw
X-ME-Proxy: <xmx:M5sVavdFiiyQXGOf3i1KeY0w_ap3X7NbGDb5dsOnVISGkBNNRLtpVA>
    <xmx:M5sVaugjXcdrOAFvFUTKOFrcE7_JupUB1XlHNlcbx6s16Q67iweQnQ>
    <xmx:M5sVavyIQEEhOY90JTiw3lwiIUnDDCN4Co_X0-F02qx21MX74ZeI4A>
    <xmx:M5sVaiPaDCOQm_mbO9qNfQuDj9ZfTWX_ZPce6XklTBIJy_W6_nryIA>
    <xmx:M5sVatN6wCiDo9bFwJlkL995qZXoFwi3wWtTEFhq5db81bb9ZOOBJzmw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4BEA0182007A; Tue, 26 May 2026 09:08:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 26 May 2026 15:07:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Syed Saba Kareem" <syed.sabakareem@amd.com>,
 "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: "Mark Brown" <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org,
 "Venkata Prasad Potturu" <venkataprasad.potturu@amd.com>
Message-Id: <21a54840-a7b4-4802-9b40-2c92893e862a@app.fastmail.com>
Subject: ASoC: Build regression for snd_soc_acpi_amd_sdca_is_device_rt712_vb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I ran into a build failure on linux-next:

CONFIG_SND_SOC_AMD_ACP=m
CONFIG_SND_SOC_AMD_ACP_COMMON=m
CONFIG_SND_SOC_AMD_ACP5x=y
CONFIG_SND_SOC_AMD_ACP6x=y
CONFIG_SND_AMD_ACP_CONFIG=y
CONFIG_SND_SOC_ACPI_AMD_MATCH=y
CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS=m

x86_64-linux-ld: sound/soc/amd/acp/amd-acp70-acpi-match.o:(.data+0xf00): undefined reference to `snd_soc_acpi_amd_sdca_is_device_rt712_vb'

I usually try to send a workaround patch when I encounter
these, but I could not come up with a good solution.

Please have a look.

     Arnd
