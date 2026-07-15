Received: from sonic311-29.consmr.mail.ne1.yahoo.com (sonic311-29.consmr.mail.ne1.yahoo.com [66.163.188.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67CD3093B2
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101580; cv=none; b=rfsENhGxq5b3k1Ei5IE62VEN4B4LkhSfJ46Zz489pmezo4EN5+Om02f3+px2S8n9s6/l1kC/9tu92y3O16GqPwN1O8ilspEgqHBRlH47UPdr1KKZ6dXOtEPMTIPVsK4428a+9o0ggf81NWaheoUG4ME8b8GkOmLngUMH4jTBN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101580; c=relaxed/simple;
	bh=VssoyfTmj6GTUS9NnVXGP/5/+OsPYQIynXW85/FS36U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=jujlehP2f72IQzAMPgzUoGZEt6Rn3bVhLZDWxRZzQPKRvciv+2Gq4gPtuIhDwLKGopoP4Dx2hjK5Sk3JK18dXWY2ZERnOFaE5wuXtsXei3cS7jYYOvXskI57jpXeeyNQRsiwWJtqROp4BSLPwBO1h2dPFsAvUukiPC/x3ESPbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=theohrts.com; spf=none smtp.mailfrom=theohrts.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=MHC6qaBa; arc=none smtp.client-ip=66.163.188.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=theohrts.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=theohrts.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="MHC6qaBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1784101577; bh=plIJm9RV84otxXFP32v7bYyxpSQuSgNSViFJBmS/AbI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=MHC6qaBa9bjfU8RcJ48hNt385M9rJq3gs9OzygFKI/YwX6DXZbNEdVTqjrMhGDiM2bvgYWSh1vLo7nSOaZZ0XJ1eMYDtNcqPOdfk10gM4xca17NMlhHX4AKET5Vlq8xwoGPsOtOIHA0w5+TNGPUD5p/cv9XLAA0gja5FfP3SAiZrkByMcIZoDSbXDXSmv/Zz5dfLnMxtoCCMiBI+cC5iLWySpjBFI3uB1Zk8LoU0YXR41pubtH8CQGg0A5M527Qrh1XId67Hskvs0U69DH3fg9TDGc/035Nf47bDn57Xpx+rR36zJmr8+NzWom9uMpB5xqRiN/6sm2Mv7IKng7jS2g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1784101577; bh=Bzb6v1YgduyMJX6HmBY/WlSKsDaVBEcIs+uGTO39y3Q=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=jXUp/aat4Db1M+ZRkiEJlxrJvwpU8uqcZOHt75CNlHwn49bjVFS2JoUPxEI8Mmo2LiEIeAGSmPts705iN8kD75bMYBn/CanilLvOn3tBrHvmrC1wWRLJWxPb6uFLYO3wz2kb8ZtoG35T9A2//DUWwCoI8v0IqytYituZ1F84YJxVdWy1MYIIfjWXHATNDSb4jwvPMfH5w1j9URHFHTnlKK2bd39jNLP3JTuPQOSHh3r7qzJTPiiazzyD5zjrjf8g3K05owpDl3zuQvOJMRkZabSu866C8SWfCHZLiO+J/PXnyZDCWm6h6LsGSoP1mQpCgzeofa6XCddXEHggRZVC0Q==
X-YMail-OSG: ij5LHAQVM1lx8ItiWtAxHjE5gTGVBQvQpH1zKqROuHBw6o7_SffZOAqEF5R.ygq
 Hqy7OJAU8PEh3e22hKlPtusZtwv4LNFuwmWVVK0aAiKzxdqTyV.2oGGMZK5b6OgucwxzMdtlw95L
 rU3OM_ow.UYdi4A0o1Pxdc5BS0hxU2f.nPlu37Ss6OTEq8NLNPVMG8tKbgWeZJxSecFIAj69BcBk
 UevNsFf_m.S0I8liHSIWg.LgMTN0O_HFfnQE6w4BNE3I7yluS8yi2yvgYUPJUXJkgjFH_tvMq25S
 mOUwltIIHlEcWiRo5Wh4PeSnAP61BX1Rbwap4LTLEzA3DBgLTBrctBIASRutW4O2r44R3weSvD9Z
 UQd_B042YqFJoDcgeXV_27RxJOCIXaHSUdaLkYITELjwXAiJlF53WukqqWqd9uLlQv4g4d0672FL
 _T2BaulIB7pmsY_YGpAKdpRSR3rAQr5Qxiq3sll5j4cJFdqJQ.OAWJ_Huny7OASuPjav7Vle6707
 dQRvGwKrBBo4GWD33CCCBVqTYGJknMXYinpOmjfDHHVWxdjbU.eBgZMUgcdODiNok0AX7hcSSV3W
 DQoFqj.QinC1yZVWRKR_iRsKfTTk_dBeaKsW.hCQn.kxQMJSRC6GL5zwPO0N5q1MkVj0XYhxNwq2
 OngUJcPcWpS7q0r5Xx7ed8LywwPAx5LbIkilPBkoj6j.Rb5vtescQR4nO9qt5KxmM5s6n41dggkl
 8rSSJFChb1s3nvdJzqrXw1Yq0MBHX6iJztybKa5bUbcHob.lEtVWvN1EDt5FHT.mFK.q2TNoBu3P
 kCP8D1qxi2U7k1r6D.sPssHj7Ck_JraVd7TYG1XPXoHtRH8XLu8NJEOfyIRZ1XB5dD.ff1QnePXO
 gP2z3jGdAv06Ov4BczJuXZZaAH_GmfnbzVOGRUnpXkgO1YwcAg.sYiDazWKHu2gFUbGXf6vxSlxm
 2mJncI4PBSqAruL_Io1bw2gWbUdPtwq4DtAck6qMq5ghfNwuemycKdY0jCs4QhGd5QtO5ri8h3Yd
 ZFxDNuwBHhzPFPfnBIRDbQaBurRPEkuraDoe0wkWrHeD42.inAnO4LUif_IBuzPACZEv5yt2yRiJ
 jp3fvv4p27olb67n5m8w0tlU3MyRdY9AM59rrR9QYvWe4TMgYQZVY9gIT.y4ARyoV9c5WqUevdfm
 PvR2j7Kztc3w_nQEfaAyljDVjxjJrUOBOHezCF3rLlLIjKI3jShJvtWP15USMaEHMZqngzIl7uRw
 zhpMcVt1FVGV7qP0J2w3XmXf4HEnnA2iXksO30UbN_nbIc9naBtRsRgTlsURt9KotZqZ1qmobE_h
 tH_k4uUYUhnGo1yYAcB6SP2BhffktqQ2vNLRHp_Nn5R5kZNGu9XOQuB6k1WnH6fAkIYQMaaaJ5og
 BCRV6kTqMlFXGgJ.l1RfSHWBy7UViYyCRFDmcA5QLcTBPaxES3OaJs4PcCN.rJzuAwHmc7rOTmIP
 EQ7N86fEYghIUZBvmYFl76J3iTASQ3udBLD5vhZhyvRXzq1qCRGDN19JM3YUcjn1fKs5.WyJtvqY
 JcI2OjwhmH_1_zin8qqDcX0wbBpN8zG.SrnaOoYz.ueJWCCeC89rXwNBxx7BCezqo74Dx5QKNAIb
 dlp3QpSBBNqh8MaUr5hkftXgkFriKpWPmYtAuT8qscm8zkGNrciw92gMowu7nObIMs3NHsMm.hHL
 vBieiT3EaqkhuPyUiD.I7rRvwSYr2x0ktwo4fDw3tZilMXzjEyidciaVeFpBz2PJ9We7wiOpBXn3
 Y1Hr90lMdBZK65lZT89Rb7yHD10CqCOzc30SaC6z0KMzF2Va3AvnNxFj5HxYVqrXShASjmGgzPgV
 H9qyeo89pTtip7uJ_xBG01hUBCYJpHWnIgDNzSaO.iAHEnAtxob.GbIMNacAL9QYRIRo5WukPyqK
 JBCcW8GKE9xUSu9nZRADoJRATvpebqgX_..G6XiGWlzK9ibH6wsR9jjfX3UKCpAbf3DUwngZRAVK
 BR2oeWGee0n0JRFnB9fjqv2Bae9I3tZlCaN1uUzR2x5XdWvQ4lmUrnp0_wtxvyOBijRsRD4W8Rqa
 1J5Kmo5_3IQIEfLjhv4IUGeuFzsW_B.QkqeGfBMtRe8tXk3W99KOw9J6asZxCCd7OyPEV8aixxaM
 c_zpBZakSUfGY9kOirxInfurALBvWAnnjaDIlDLVlU112JbTqCfrVoTY3TpH1Ec.U6.V3iRlVzD4
 afWZCIpI3YLX8CAn9YSEBrqTgCMuwLljZRVyI3In8sah3954cL3dK0JwuxidL5.7rb0lGIt7TaCA
 W3ThkWiHuVMjx2vgUnuDov1QApc4RuZ66LiOAq7ryYQ--
X-Sonic-MF: <oliver@theohrts.com>
X-Sonic-ID: beb742ab-212c-4555-b9fb-65d916f5007a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 15 Jul 2026 07:46:17 +0000
Received: by hermes--production-gq1-6dc558886b-gjrc4 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 59f344348f05d2845bc62437dfb48563;
          Wed, 15 Jul 2026 07:03:46 +0000 (UTC)
From: Oliver Ohrt <oliver@theohrts.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Oliver Ohrt <oliver@theohrts.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speakers on Alienware x16 R2
Date: Wed, 15 Jul 2026 00:04:09 -0700
Message-ID: <20260715070409.42696-1-oliver@theohrts.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260715070409.42696-1-oliver.ref@theohrts.com>

The Alienware x16 R2 has two pairs of speakers, but the BIOS
marks pin 0x17 as unused, so only the pin 0x14 pair plays and
audio is very quiet/dull.

Apply ALC289_FIXUP_DUAL_SPK like on other Dell machines to set
up pin 0x17 and route it to DAC1. Tested on my x16 R2 with
kernel 6.18.38, and now all speakers play at full volume.

Signed-off-by: Oliver Ohrt <oliver@theohrts.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6932,6 +6932,7 @@
 	SND_PCI_QUIRK(0x1028, 0x0c1e, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c28, "Dell Inspiron 16 Plus 7630", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0c4d, "Dell", ALC287_FIXUP_CS35L41_I2C_4),
+	SND_PCI_QUIRK(0x1028, 0x0c90, "Alienware x16 R2", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0c94, "Dell Polaris 3 metal", ALC295_FIXUP_DELL_TAS2781_I2C),
 	SND_PCI_QUIRK(0x1028, 0x0c96, "Dell Polaris 2in1", ALC295_FIXUP_DELL_TAS2781_I2C),
 	SND_PCI_QUIRK(0x1028, 0x0cbd, "Dell Oasis 13 CS MTL-U", ALC289_FIXUP_DELL_CS35L41_SPI_2),
--
2.50.0
