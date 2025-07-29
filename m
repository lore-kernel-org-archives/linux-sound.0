Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E78F54
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753795974; cv=none; b=TN7454+fmuNzzucOBNVERL86KHv4AurMGZu/psOaxcz+U6q/qQulNV8Pq0NavxKY5XxM9A/n+ihAiToXlz2Eox1LaXq5pu06LtwAkIpxQ7kJuN0zf0n+HjABilJq88JahoFCmlsUcIrSO2465/T6zM81JGKR0ccuqZ3ZZ1zkC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753795974; c=relaxed/simple;
	bh=kZPp0HYbotHF59jE5UFZlEk1UtzkI4Gr83koThhit5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8Drqy5mMifqYfjz2I3+097ajuvKimSlwaLrVACemXDu8UhfI0IwDmGUf1merFudccGJuBRhvaZKaK0M5+o5i4w/TWaseVoC0cMjcGata8uaNX5Gfky9m4W2FgEGthGDtDH3rCrlQEr0XDbeZNPMyamOiJ1lSHvlHdR9k7pEYss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROv7l3eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROv7l3eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5877CC4CEEF;
	Tue, 29 Jul 2025 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753795973;
	bh=kZPp0HYbotHF59jE5UFZlEk1UtzkI4Gr83koThhit5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROv7l3eqYOJV13/7g4u7yaPzvm8QxD+WM8DLO8ggTV9HYvKRMGXfipWUASA8v9pE2
	 XSHFUCCiyrhmzV329bbaEyJry36IhrTSQbu+BIR97PGv97KTzsE/AGZpBV//dujP7c
	 VSRnAwJiTNBy+FcQ5pJv7Z8Ep4+vpyFSMYyk9aBGe+vq8SPPAQrVbhy8SEjtl/8L/l
	 IGcMC/eUM+fxnzsubur6LwhvRoSWgMOnEJ3MsQxpmWR/QTyf5pgr6LLXRQ8PI8i0R0
	 VkIi0ud8jOvmlvAXvHxyGJK43SeOOpRa2HXADbLuAE9HcVS0UUdWQCZNfTXCzaIBRZ
	 Cyfg6penoIATA==
Date: Tue, 29 Jul 2025 14:32:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Synchronize happy and error paths
 in PCI probe
Message-ID: <23104b50-974c-47e5-a79d-07dadb2bb3ce@sirena.org.uk>
References: <20250729114229.309472-1-cezary.rojewski@intel.com>
 <20250729114229.309472-2-cezary.rojewski@intel.com>
 <9af2c2ca-103f-4f2e-afab-1fea5a2160a5@sirena.org.uk>
 <179e32a8-b20b-40ab-8663-2a793a96993b@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lv+yOZHc8hdc2Jjl"
Content-Disposition: inline
In-Reply-To: <179e32a8-b20b-40ab-8663-2a793a96993b@intel.com>
X-Cookie: Short people get rained on last.


--Lv+yOZHc8hdc2Jjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 29, 2025 at 02:49:18PM +0200, Cezary Rojewski wrote:

> happy path:
> 	pci_alloc_irq_vectors();
> 	pci_request_irq(bus);
> 	pci_request_irq(adev);
> 	pci_set_master();

> error path:
> 	pci_clear_master(pci);
> 	pci_free_irq(pci, 0, adev);
> 	pci_free_irq(pci, 0, bus);
> 	pci_free_irq_vectors(pci);

> Is there anything wrong with the approach before I send v2?

Unless there's some issue with having master disabled but interrupts
disabled that should be fine.

--Lv+yOZHc8hdc2Jjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiIzXwACgkQJNaLcl1U
h9Cvkgf/QOHeiSUYc2iYWDG2DCut4RqoaY02TQdwAHEyIGMzF8ttvYeh5TpCD24S
1qn69A0BeKkbyDA/zjjc0k0ZbGzHc8Nw3PVbXq005LhiLRzd5tGRC6XfCigiXk3G
LMX+O/7e8nqXfbiIqdDchoPC13HXPyrPNKcrkG1rO6srIeACWOZZjCzy2uY/SD/L
yfgukl5LaiTo/w+9+kf4SA7PL5Uq5+6pL03+Ght4BQt1oppD1HUcMMpzvOHeyZaZ
JiJj45qAckhEdfH2yg+tPkN0ZL42Js9Gf+utJ3K+JbN1wpBeO31r8HO1yM7VcpbX
oq4DrOIeKvcGeSHwRqzQqGDmqRGAlw==
=4h7z
-----END PGP SIGNATURE-----

--Lv+yOZHc8hdc2Jjl--
