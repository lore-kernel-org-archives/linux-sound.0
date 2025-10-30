Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB12EA48F
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852357; cv=none; b=Gr+kP2uyFaopACr4htHnFJOyc5hlTg28srcxTrJQ+GwTUIVuMYUlAjttwkh3lPh6GxxI1me2Ki4MhBxpfE9WhgNLSonaV80EBiJzVrZBqs6TFs17g16rlnDDdUhNH+QAl7kIlDrZOLhCODSZjgnkg6aEbgs1NCfN6fgSddCSreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852357; c=relaxed/simple;
	bh=IsCCeXIuXiW3stfq5U7BO8ZtxJbz3Bqdq16X/mdaIGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reu6F/B3Q5mSO2xUydfVRgLPvv7EKruunABAZZx5JV8gEdsk0dQQE+rkXjJeWkWHPQmcbZdZVN+6t6Z+tHvM2lKur7U0Dwv5iJB43adjYy9apDPMYbRjvX/HZzEOaUtJ+RN0D8k3bGy8HRyiiOrltPhEBOWDnUcGEusXI6fbg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+Iq8KjG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+Iq8KjG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427007b1fe5so1115213f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852354; x=1762457154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=el8+pV2vAMXiyqDVlG1nQSsbguxe1rAmCs7T0g0V8JM=;
        b=b+Iq8KjGBmShbXM3NyLyFinYlUBRo2wCeazdAF7AMDg0hLPUdQN1YMdilFiaFJckcX
         vHucWzVCcpE2jaYonMZ6jV5Eom/72cMxITg3fGs7rxSDUu6n9N2QU/0X4qOhFtSrhfz1
         oVqTDFfORgXCP5pHCH2W7keH2ZyHpYiE4Zm+/1kmHjVxLvYGpbAldCh3rNyrlXJ9zkWn
         FT1z39m4fOT2Qm3pWOBEpDFr1mewEj2Wr1ikEEC1A9e5drC787K4OvYF9fOjLk0JcJTa
         J5gtBX5GOb/19rfKhFQcd4bMLHh45k6cwXeqsU0A0G7j35eYE5y8GaJiDszQGxrehNaj
         y02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852354; x=1762457154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el8+pV2vAMXiyqDVlG1nQSsbguxe1rAmCs7T0g0V8JM=;
        b=F2pTNxqgWGQsPL2ySVvhbpFYHKG6n/Rql4i/U2DFv+0fmf08N1DIKxagv0snduxX/M
         3DCY2EwebszD+6s9isRf0JiAtGgdhDTHvo9VxTjqqAccosf0qiUXBa/6Dl+9xxIWkT9m
         lkBLT1rEbQm5pmx2wEbG4dSp17Gn+YaP5yMZtki1KlKkLGSzWDdce/Rb0+2LimR4oeoQ
         CU1LK0AZIpzWxNY8xQ+SAC4jKVSN4nMiFwyjCtbAhlAGyV+bHY8TfLBiH1buGBeqdsPH
         J4PgLmwPepu3dAxd47uTG77oJIZgVfDjaFYgJHM2U3ZKRVAJjeGUkSqbv7ioCUG4Qypq
         3WXg==
X-Forwarded-Encrypted: i=1; AJvYcCUT/zOICD/oyri4+1lELHdXuVvf1IqrhaPWeqGDm4RYy9E1NkoNIBQdzcvRT3RXgh+ZYey9Cn3FHh93qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwueyN8S/f2H0eZUKz5uvK8kQCYUcfGg54la/NiZjVqmX7vOscj
	7QcrSBX+1yg6jlx3KkawBo01uxSwVp3VMCaeL4d0llQzYjRku+wivQh5
X-Gm-Gg: ASbGncvP/lLmEdRPRRFyYgYxXdTZU/B5Tizd14MW2eFsTPOTYWkE6NS5UGQkuKe8SbL
	pxcCxz5r2lrKcro+oBiuMo927qor/ujO0vhfUYWE6/9JVZsfVOqHTTuYWhk7uH8QGg3vzVefr1H
	YBVEOhslwCTYmTa4NGdQCl8Qrm8BKSdYA0D2TIdI5MZUqUVM4jgzKU7bX+BMQpek7vk3e+EdHzw
	j6gYNS09aXHII7NybxmgGHHplzJ7363Q4/THfNKN92qKbUVp0vkioaM1UZ6/0tZwtaL8RxtRozu
	ljVus/K/eYKjjYwm6fLScJz4Hc9gMJ0o4+6gVfUMuaINIC6/cSFU8C9jZaMjk/JnjvcY7itQMk4
	CfYMlmdOO4KLA0c9ds8w4GWnVoLNIcqPCzaZv7zuQ3giVUIWf4g7RWK6E8mNJzFvcpvngs6n2Zc
	luKDknuKOHTYCYavo+NHJmUjXViAMexAmbR6j3dKUcp3zoy9hLCjedj9uUpCeefH4=
X-Google-Smtp-Source: AGHT+IE3xIDwnt8NO9gbUQB3KijPHDP05Rq680UcAG4/m3XHIlHkUMPbeqsLE7Kwcs0Zor4mVUhuHg==
X-Received: by 2002:a5d:5d0d:0:b0:426:dbef:9abf with SMTP id ffacd0b85a97d-429bd6837f5mr659933f8f.23.1761852353820;
        Thu, 30 Oct 2025 12:25:53 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da645sm32324401f8f.30.2025.10.30.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:25:52 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:25:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: "Sheetal ." <sheetal@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 1/4] dt-bindings: dma: Update ADMA bindings for
 tegra264
Message-ID: <5emjmww2vawtquweilm2ajmv7ux6ljwkyz26cqnwhe566vtxqj@hjo77tk567pn>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
 <20250929105930.1767294-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3nwz6pkhho24mer"
Content-Disposition: inline
In-Reply-To: <20250929105930.1767294-2-sheetal@nvidia.com>


--j3nwz6pkhho24mer
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 1/4] dt-bindings: dma: Update ADMA bindings for
 tegra264
MIME-Version: 1.0

On Mon, Sep 29, 2025 at 04:29:27PM +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
>=20
> - Update ADMA device tree bindings for tegra264 to support up to 64
>   interrupt channels by setting 'interrupts' property maxItems to 64.
> - Also, update the 'allOf' conditional schema to ensure correct maxItems
>   for 'interrupts' based on compatible string, including tegra210 (22)
>   and tegra186 (32) ADMA controllers.
>=20
> Signed-off-by: sheetal <sheetal@nvidia.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/dma/nvidia,tegra210-adma.yaml        | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Hi Vinod,

can you pick this patch up into your tree, or should I take it through
the Tegra tree?

In the former case:

Acked-by: Thierry Reding <treding@nvidia.com>

Thanks,
Thierry

--j3nwz6pkhho24mer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDu74ACgkQ3SOs138+
s6EpLQ//X9VzCgAX/G/3K6C197+MTv9SDzEHBXtQd/vVJndgAvMhrwWBalp7uAuJ
yGv9CD3ib85ccgvBX12oY9x9kR8fcU2Ueyq/q3inTXcJ0eQIXwwzodA179kEPb0D
gID1Gh4GQO8w6dMoa4kXETQfaiPFiLcNqY5/ZzhP142ewpo8uMDWDh1jF9+E3+08
Q5qK2CvBeX/NnD8MTfLHiLr9LUAuRsqP/HD0Ff3VemEcawCTC8oqfhcc3aSR9zIx
hlPBSGnWWw1CFXt0sQk+cD6qMSVotTkzFcGTKpUQP3/wQ1mytl9VKlUzZhOn+fSS
1Q4UI0ebUL2qIZavXxiN4K6FreupBZNnmmJ88bR0Gfbc+oDObPN2dOZK8BQ0dFHr
6qKfuK74GFqY/d+T5/ewa4WapaTPo0l+liTIPVmxWrXq+wtTBS3OsCLZAno72rLq
3DJRV9jywdNrQEE19jG1N4M8Q5GilE0JJ1IJheZ8IpXp063YKSGT04gUG6kidBdp
z5dfoumLJk+NtpjOhTelg86Fs5yEYeHiQHv74+WX53w/Ic4ipKESb5oGwDs98jZQ
iy6+e6oB/rigSK50jJTiLy0UMl/kJs5eWbhZavwTRmcdGPYUL6jHqnim8PChbL69
UwdsFcEqki8rikgxb4B+EHQhzKLL6dWL19CG5KPlfF3eNzgZLfE=
=bQb4
-----END PGP SIGNATURE-----

--j3nwz6pkhho24mer--
