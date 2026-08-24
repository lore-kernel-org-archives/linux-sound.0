Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB14D36C5AE;
	Mon, 24 Aug 2026 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593552; cv=none; b=a2EKSt/I4zsAUCov/ChZGbp998AxUWeRwWQIpQyiZ/RnnV85OTh7uYIgblKJERw4haOV5gvQsUC5zZlUqAQ7blzW06ue6l/vkpfOabOd2749H+1IUYsiPLLQu5SOX1kx/COFClXv3Q37rOfRiLvYHh8Qafyivu/kalGq6lSLrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593552; c=relaxed/simple;
	bh=Jbx4XHMuyYRTFUmgKrHoJRw+oYGQdH1nxwNLutsS5GY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DDgPsq1eOhTD4E9hOJ6+yNKTfFFw4TXRfzrLbrYmIXfxrYmU/BLpcQKg0acYkkM+aY5QNgtKXB33eKfRyfcbbOH6HPbZJYb6kRcy39kZHeEbJB0Gr7v3sY58ReHF+fm2tYNT2wzo9noIuGhtcTfJ6VhANaolkJgRDzTVUfWv0yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T02LnGkR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T02LnGkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787593537;
	bh=Jbx4XHMuyYRTFUmgKrHoJRw+oYGQdH1nxwNLutsS5GY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=T02LnGkR+ERTK0+GFfCiT+/mkkzbEC4mPRVPO5d5AE5Xy95aoUpmXaLqt+T9kL+IF
	 rIBEkdHEva1RsBJM5yKcMuZMUthIABRWuI0hs6boZ/eT6Zof/shwB4T52BjiOgIBVI
	 e2ESZ8xw9KQZXIjrX29JFQlWkn6VcICfB6cbdeI4cGYco3TN8ms+aduIWt5jAQXZ7b
	 m2lZuoJ5tJMDpZGeZ/bii9lgMP7wXJqq/UGWRs62uaAMtJPdLVvWSpHzPgS9tv8XJn
	 rqxbXmlWcPaS6ZzMi7MdEmEw1FNqodS11CNJ29kNHG5NL3iEhoi8QwZb3zMRLXyM+J
	 ve1+DQPbm5nsQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68FF317E01C6;
	Mon, 24 Aug 2026 19:45:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 21CD4480029; Mon, 24 Aug 2026 19:45:37 +0200 (CEST)
Date: Mon, 24 Aug 2026 19:45:37 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org, lars@metafoo.de, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	kernel@collabora.com
Subject: Re: [PATCH v3] ASoC: soc-generic-dmaengine: Handle DMA channel
 request failures correctly
Message-ID: <aoyBuho270dTWYBL@jupiter.universe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyznkctz622woh35"
Content-Disposition: inline
In-Reply-To: <20260720064131.75156-1-phucduc.bui@gmail.com>


--oyznkctz622woh35
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3] ASoC: soc-generic-dmaengine: Handle DMA channel
 request failures correctly
MIME-Version: 1.0

Hi,

The new warning triggers for the Rockchip SPDIF driver [0], which
is playback only and thus only has a 'tx' DMA channel:

[    2.275100] rockchip-spdif 27ea0000.spdif-tx: DTS/ACPI name 'rx' not found, legacy failed (-19)

This is from RK3576 Sige5, which does not yet have the node enabled
upstream. But it should be exactly the same for any RK3576, RK3588
or RK3568 board at least.

[0] sound/soc/rockchip/rockchip_spdif.c

Greetings,

-- Sebastian

--oyznkctz622woh35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqMgzkACgkQ2O7X88g7
+poKlg/+Pq/tpj5JhoQcBbgjyBqWZlZSsChtvIPnNqllb5ByTHuvbR8dB2HzN2ze
HLsaWb7g/DCrqi5WqDPP5rgE903dpfqmpGzJahaN3bMXoG/hoEZ3Thx7i6dlW860
pxBDF0BBzmMT1A6nWeOQV+moYUQBrMNPZQd+ut6lN5v61owDUhJdYnv95e3MhAka
SEohAF7QdLq3RlavAelYWeri5bhL/8XSIo0WZoUJm56C55vcNpXTvPVnDZ5dVb5L
muOYnzR5CtsDclXxN2NRvF10gFzz87tUbTcUxqWg1lkpUhY20LnsdHLHGB+9mFTQ
N7+wG42gZE9OuN7TVDGoZItE/BU1kviP5hxt+YnCIt+cw33gmK/KJMqoMVDmjqoQ
s7rZKBjC7bFkQk2yHiTfBKbWUKvf8rVd714S7PKB2lrCXhPvl5mkbctz5X3LYLzI
U5gLGO8UF0MUscFp0uLT8YwHkrDvdOwAyoS9u+HK2cPW+FQ6GLgSGjxoc0Fip7T7
C0PpbYAnbVWLaFUoU7WnX9QedjKTEX2bV9guPS49cfR5zG6Yxxqg44lQN6mSyFyT
bhajf+PrfMfYvJt0wjYFDl8FLtVeEUyu8y6qA2O2+fEGmNBGCkwp7H8hH0VzDipX
69KIPLYwQCeQFF9SPMSYRbNli/dh79QgPGjwSHsKgb20EYsqv9A=
=sikX
-----END PGP SIGNATURE-----

--oyznkctz622woh35--
