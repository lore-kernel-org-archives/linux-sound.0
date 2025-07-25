Received: from e3i314.smtp2go.com (e3i314.smtp2go.com [158.120.85.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68458238C12
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455515; cv=none; b=MMq/dpKs80nk37a88mAsHkhnPPZWuOqkmIZDKDkORRSx9UeknetMqlmrQdljpLkuzHAQAArhoZ8ziAzbuQLKNepnUjZXa+nroZ+ENILx31HSN9EhLIQazt1AYu/wk6vwtYLypI38BdghN+fC2SM1zsaP0x6hYzfg46gAQ6R9vW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455515; c=relaxed/simple;
	bh=bF8/csET5SNqtwj9JF9QFqV0DeWFFnRuoxPZBgbfsdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkgfTXcLqGfeYPVtBMpZF+SJeThUg9ZaxEqi9zgC1+0VOMynPIq1J+N+8UdplSKmU7wP/7zWIo4eelZVl/RsCWLKwcSB6kFCu3icSkaMLJYyvAc4cp8h2cjrtHbMnZ+sBPFA0rMcrsW1OD7hWloXXbsqJrjw7/W37YeWFgEF88E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=E/ASWNf0; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=Ww/JKSXX; arc=none smtp.client-ip=158.120.85.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="E/ASWNf0";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="Ww/JKSXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753455508; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=tl5AxARlMSzyRXW4Zbs7qJk+ktNSIeI/HtBHi+C3wDc=;
 b=E/ASWNf0sgLXRAjxrYDlxtPYhX6148b0NuT8yL3RKH5BTQsq5HK3/Hva6BXvdl6b606P4
 YxkcpvozkUhq7AV0snG2HaDiONmdWtofEd14VLWxgqcyos+Tta893+0av87qv2vs4F2QCpq
 R7m/b4uLmKywL/prdSe8k1j6WDJUXwidWx3Xjt+x9bHvqHJz8S0WaDn+o9HmMLMXi1l6nhp
 4kqQFvryxcEkOkboIFl7Jb9U2c8zVKfJDAncURQ+QBE8WEisRAHItTA8OyYfbpMXR7/sqVp
 OU2frkbB+qRsmCykkWziQ2xid8BqoI0SFgURnjxjFX6telN8pbd3AP+taZRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753455508; h=from : subject :
 to : message-id : date;
 bh=tl5AxARlMSzyRXW4Zbs7qJk+ktNSIeI/HtBHi+C3wDc=;
 b=Ww/JKSXXIV7wdjIXm9jZ6G2aV9YyXU26ZcBLiN4BMA1bkg+rYQGbRpcsQmb/dIE823kmK
 GyngaVskxDtT/YT/PkTsiSP3nd64xCR/Gaq7gKZwN85nFpYUieLQ4+KCuVCHOhofV6w8NnT
 qyMknc98lSo/ba41sOCKPhtyvBfOe1vB5aTFVh7tGwQ+AvAnv99XhlzSe8v46hUqDxlrS3m
 /FKJxPdKIpLTm1NnyqENu3ueu13j/jTWEQz0I7NDH1D5p11LicdOG/ZIj51fcyhXtqdHOjg
 OPOI87WT8j5RK7DmGeVY35Z9FRsADSnAuAEWJ2DMGX5jgKFmT+BbWI1c4rnQ==
Received: from [10.152.250.198] (helo=vilez.localnet)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ufJsI-FnQW0hPtRBK-dTGU;
	Fri, 25 Jul 2025 14:58:18 +0000
From: Edip Hazuri <edip@medip.dev>
To: perex@perex.cz, tiwai@suse.com, edip@medip.dev
Reply-To: 20250725144911.49708-2-edip@medip.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Edip Hazuri <edip@medip.dev>, stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek - Fix mute LED for HP Victus 16-r1xxx
Date: Fri, 25 Jul 2025 17:57:19 +0300
Message-ID: <2420183.ElGaqSPkdT@vilez>
In-Reply-To: <20250725144911.49708-2-edip@medip.dev>
References: <20250725144911.49708-2-edip@medip.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sR_qNS80Cz
X-smtpcorp-track: b4cTr1L0ldhD.ncUCVUCqV6Pd.EgYiSQd8Yor

On Friday, July 25, 2025 5:49:12=E2=80=AFPM GMT+03:00 edip@medip.dev wrote:
> From: Edip Hazuri <edip@medip.dev>
>=20
> The mute led on this laptop is using ALC245 but requires a quirk to work
> This patch enables the existing quirk for the device.
>=20
> Tested on Victus 16-r1xxx Laptop. The LED behaviour works
> as intended.
>=20
> v2:
> - adapt the HD-audio code changes and rebase on for-next branch of
> tiwai/sound.git - link to v1:
> https://lore.kernel.org/linux-sound/20250724210756.61453-2-edip@medip.dev/
>=20
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Edip Hazuri <edip@medip.dev>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c index 05019fa73..33ef08d25 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6580,6 +6580,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>  	SND_PCI_QUIRK(0x103c, 0x8c91, "HP EliteBook 660",
> ALC236_FIXUP_HP_GPIO_LED), SND_PCI_QUIRK(0x103c, 0x8c96, "HP",
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF), SND_PCI_QUIRK(0x103c, 0x8c97, "HP
> ZBook", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF), +	SND_PCI_QUIRK(0x103c,
> 0x8c99, "HP Victus 16-r1xxx (MB 8C99)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> SND_PCI_QUIRK(0x103c, 0x8c9c, "HP Victus 16-s1xxx (MB 8C9C)",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT), SND_PCI_QUIRK(0x103c, 0x8ca1, "HP ZBook
> Power", ALC236_FIXUP_HP_GPIO_LED), SND_PCI_QUIRK(0x103c, 0x8ca2, "HP ZBook
> Power", ALC236_FIXUP_HP_GPIO_LED),

I'm so sorry, I forgot to fix the subject.
I'll fix it now



