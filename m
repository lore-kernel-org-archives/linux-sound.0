Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296694;
	b=1KZb1ZlDtuGR4CRdQYpzf/fnsiaAvMFtxKCUW2ZqXHeJ9krKjbeEvMwlhbX0fvLtHo/K
	 7ZzdftPYHCchdaqRtzny4QTD9W+EvQaESBnnh5DDoDbhKs8X4b7lLx0hl2WViUB7YTLa1
	 IY3M1cu9IEf3ADjzru856ZvTk0gKtu2NwO+QZm8eNVdpXXBI71a7ubHwjF40dxHO66rSD
	 ygrjZkrTfYuT+PpOuH0VIjS9wI7ntdDlVvuH1LIXevnTOFj60IuI02jYMRIqfIuPGopgz
	 Pw+hakaZFV1kWNqlyAZZNf0qumur8gF28tcmryKrj+d7DQQr0eEC7gK6pOaQdCWswSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=93Yp0mOoQjajd5b9JPpUp/WswstNFmRJz6zO3e3RDvA=;
	b=cUWVE8qy1ycOPGjcF5YmfMR6fVZiMd3K3D2l3152C8ubBMrKfUHJKhWJ+LbKE66I6NYz
	 3CJm2EnW4iu0FRKIFdSdiTkM2yhMJPt6U0T0jsCBlKfJ6xTM01wIGeKDKpF/6qCRX7gOB
	 IGoGa2k1Ni3SLZThkdvvMXIZyD+vx51DsDvAl1nn88oTkVi3KpHzQgZfYzzCP9XYrUL4R
	 LA8l/Tqn4K1nRpLsMqwWf7e5wkMtWKCCFdhJjK4TI57YluZmOtux5XHJG94aWXRa2vRr+
	 4AzsnqWD22a6Lt/tGJsCcn7xM6m5BmZAbilZT0HqiCpQM2cWcoIjjb/cxkDaQi11NzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QObXu0Ah;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CBA606C63C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QObXu0Ah
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7131F008A7;
	Tue, 10 Nov 2026 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794296693;
	bh=93Yp0mOoQjajd5b9JPpUp/WswstNFmRJz6zO3e3RDvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QObXu0AhoNflA2Byf677kDlmeitNeko/X/JW2zdBtjtYY/Yrvw8XHHZey8Ibq4Jrf
	 WTJZLttZexgOxyN5bdIIFFfG+Oug95dxBq3hTvyXY9/0QHy9zkw/AYafOgO4u0VBRi
	 Wn0ghoEPi8eSI/ZXZ6MmyogCByG0IUKoiBKrvQAooKDSDGhyb/BY3M2nbgz6CoUIu3
	 67Gem3ujgt8FKsUkrVNzQ8WBOCxpbY3amDiZoI6/NYRiwYqROsyDoFVUaE4k8jrWbA
	 t4oivJgcteqmyy9aVcNeFR+4Ii6kBdzV3auV2HEfOtnzVqmlgVMj17abQ2W5ftjUJX
	 dqaI3yagbphxg==
Message-ID: <sashiko-outbox-206531@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: sdw_utils: senary: handle a missing name_prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianghua Wang" <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261110073420.842175-1-qianghua.wang@senarytech.com>
References: <20261110073420.842175-1-qianghua.wang@senarytech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:44:52 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: sdw_utils: senary: missing Fixes trailer for NULL
  name_prefix fix
--

commit 845de21a0dee73033616aab7b25b28f57952951d
Author: Qianghua Wang <qianghua.wang@senarytech.com>

> ASoC: sdw_utils: senary: handle a missing name_prefix
>
> asoc_sdw_senary_sdca_jack_rtd_init() passes component->name_prefix to
> strstr(). When codec_conf does not apply the prefix, name_prefix is
> NULL and card registration oopses.
>
> DAPM widgets then keep the bare names from the codec driver (HP, MIC2,
> SPK, DMIC). Keep the existing "sn624x ..." routes when name_prefix is
> set, and connect those bare widgets when it is missing. card->components
> still reports hs:sn624x-sdca and mic:sn624x-dmic.
>
> Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>

[Severity: Low]
Since this fixes a NULL pointer dereference in the SN624x helpers, should
the commit message include:

  Fixes: 77272ecd96d7 ("ASoC: sdw_utils: add Senary SN624x helpers and code=
c_info")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110073420.8421=
75-1-qianghua.wang@senarytech.com?part=3D1
