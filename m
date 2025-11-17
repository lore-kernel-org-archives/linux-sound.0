Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6CE1946DA;
	Mon, 17 Nov 2025 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363065; cv=none; b=sTE3DOsJ9Qgbma0AQFlwidhzXfkJDNEuRGdXykwgxOgQPV8MQnp0cRqHwVuEjl5ComtT7KlwOxXw3KKaoLQeC6BVOmsLD+4iMlmmp5MR5DlzZfzRUjDzDFnIsKb1iHKxzxkW4frQ8UiJxuAmhnWXbJ8Mlc1a7CqfmGragw8Rqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363065; c=relaxed/simple;
	bh=btJzgQ0yIDRBJAlerO2k5O/rBGWEXadFY95sWAhI3Fk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qufh5mzZ8FmFiUHzSo28zPWokRmqCuW1kYh4xi9aQWBvJEpHQXiY5luq6I720g9H3mU96i540PrC0oBf8nJquf4RWJhSWz5d33ovkdTxTksCzJMrpUqO+Apgdd7syL8bCPdp3HlaKPebJp0azFQDFZbf6Kzdalcbe6ZoxDuhfK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z6KQB1w5; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z6KQB1w5"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d8zJ31yXhz9tFW;
	Mon, 17 Nov 2025 08:04:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763363059; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DKlYzYiDyHCvirQt0aWakX2cK/GXIq0iqHca8rJkW04=;
	b=Z6KQB1w5gqmBhtDCYUag7yw14ZtjnfrcFQj/Zop8aGo82ezyVqFaRXqZAsKaWclTN3JWeP
	bLCGUoIwSQkemIFP1XCrLE5I/+lrPw9at2aZ4x9O87lWNAy0Ba4VeYG64BcUmh3DCgGY13
	KqtNUgeN7BAqEB2Tyq7krUvTCcHbJ7sbVj1lOM256BQwOF/QPlvfVTgVrDZ9eL4o9QDmSC
	kZA3A9QQllSSJcZ0GcwaEN0XYZzc+xsknKJZ5EhGdFjsEuI4E9OTsyl2iG4OzTZ2lFqRw2
	r03qNJR23asLlndW7LQ4FxTGkT1nQGIo2XHjf5UTWAHHaOxTKB8EvxQC2VZKrQ==
Message-ID: <08327c56d28c0629676ab8120b1eefce9e988676.camel@mailbox.org>
Subject: Re: [PATCH] ALSA: au88x0: Fix incorrect error handling for PCI
 config reads
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Haotian Zhang <vulab@iscas.ac.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Philipp Stanner <phasta@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 17 Nov 2025 08:04:16 +0100
In-Reply-To: <20251117065559.1138-1-vulab@iscas.ac.cn>
References: <20251117065559.1138-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: gbprpup9birz6757uzic7eow8d9d6wcu
X-MBO-RS-ID: a93fd58985c1f2f2d80

On Mon, 2025-11-17 at 14:55 +0800, Haotian Zhang wrote:
> __snd_vortex_probe() uses pci_read_config_word() that returns PCIBIOS_*
> codes (positive values on error). However, the function checks 'err < 0'
> which can never be true for PCIBIOS_* codes, causing errors to be silentl=
y
> ignored.
>=20
> Check for non-zero return value and convert PCIBIOS_* codes using
> pcibios_err_to_errno() into normal errno before returning them.
>=20
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0sound/pci/au88x0/au88x0.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
> index de56e83d8e10..bb02945793f0 100644
> --- a/sound/pci/au88x0/au88x0.c
> +++ b/sound/pci/au88x0/au88x0.c
> @@ -280,11 +280,11 @@ __snd_vortex_probe(struct pci_dev *pci, const struc=
t pci_device_id *pci_id)
> =C2=A0
> =C2=A0	// (5)
> =C2=A0	err =3D pci_read_config_word(pci, PCI_DEVICE_ID, &chip->device);
> -	if (err < 0)
> -		return err;
> +	if (err)
> +		return pcibios_err_to_errno(err);
> =C2=A0	err =3D pci_read_config_word(pci, PCI_VENDOR_ID, &chip->vendor);
> -	if (err < 0)
> -		return err;
> +	if (err)
> +		return pcibios_err_to_errno(err);
> =C2=A0	chip->rev =3D pci->revision;
> =C2=A0#ifdef CHIP_AU8830
> =C2=A0	if ((chip->rev) !=3D 0xfe && (chip->rev) !=3D 0xfa) {

