Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450568;
	b=G6gongYRpFyYgiBXQVomjl8STPgtr5whcCpYztYylBWOtLoaeDxIw8lIaT6waUy64aVu
	 QkRrRz97dtMeryTiQH58rDbyNQqs67W9tukXfaNaeUOL4zgqlZFSnboB1yArcQvCUE0mW
	 mQ19AulFTlin/APCfdIMcjqaW4sKvawZ3Adn/pBETsyoEhn9Ub3CEzfrEHXi17m0WyIJi
	 NpRDjnCojZUJSO/6oobLmTaqCQc5jYx7omTsd2frqGvP3XPisjJjFyxTq2RXBtKJ7sIqW
	 Sct+RhIkeiASlcJortbOwKlJ+tLEBqfohQkFBVRXcfNdHADLVZtw4XjpzMWP3of+kGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450568;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zPCePOrJ3uEjz+3jjk7jWpNV5zLzf2Jicak5cg8TZTs=;
	b=QgR+Wp0+tpiMuFpFh3ErQX4BYEcGbFp/0ma8DSiDmIZrYQFPDAByKMSJF4PdCkT9kTLe
	 z4OBiekNZmK9UtWT9CTQ54BxydsqIp9OQL2lre9YHijWvgAiHol9iJPoMc3jxDmP/412p
	 8eRO/MJj+TXOqmioBhEYrNlFG2FJlmoSbHgiku2rAxapo/KQlTbsMDLpe+/pQ//Zw0rsm
	 iz+kbEVyDV+SyhB6eozX2Kjq0Eu6LKnj9H06aSdOuZyO+Gm20AKr5G4CR/50sgNp7MK8B
	 32d2pGxvWzu8uFB7hHw6sTrcuNaicKkefk1Rr3d0f4/gkmlojeOOi0UpNgqzxO/G5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KM/xLL8H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F578606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KM/xLL8H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AAA1F00A05;
	Thu, 12 Nov 2026 02:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794450567;
	bh=zPCePOrJ3uEjz+3jjk7jWpNV5zLzf2Jicak5cg8TZTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KM/xLL8HphmR5UO4TLAKjBKVruwbOhgzHHeq+L1b/ldckk/c8BwujVcFswoh+moDo
	 HRzUlXzzFaE00pS7KbRm603/EfGWVS50ng0e9qERJPsPPWNpdio76FxzDBag0GILhU
	 9MLWAslMR8nD4/5t0aQ8jrYer2/GvJqU1JowleoUniTgzxTfvbmV6OYwennf8emPDI
	 EidagP1FkTqhJXCLoxOkFXiAsnOfT3ew3O0VcvN4lDn0InKMK4hgH4Jcr9xENj3h0z
	 J1lKbmTPcPYFWpB5bd4pO4y3ugOrsVPg1ucbVgMZggPRC++GKh+1V6g9BoHgbvTymG
	 oVBKds945/sug==
Message-ID: <sashiko-outbox-210194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] soundwire: mipi_disco: Put fwnode on property array
 read errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112021827.1835-1-laixiangwu@cmss.chinamobile.com>
References: <20261112021827.1835-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:29:27 +0000
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
- [Low] soundwire: mipi_disco: inaccurate Fixes trailer and missing tag
  for lane-list
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] soundwire: master: buffer overflow in clock sysfs show
  callbacks [1]
--

commit 64b469cb0e928d1152da84b0b4992092509cd6b6
Author: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

> soundwire: mipi_disco: Put fwnode on property array read errors
>
> sdw_master_read_prop() and sdw_slave_read_dpn() take a fwnode
> reference with device_get_named_child_node() and already release it
> on the -ENOMEM and success paths.  However, the error paths added for
> the property array reads jump straight out without dropping the
> reference, leaking it on every failed read.
>
> Release the reference on those error paths as well, matching the
> existing -ENOMEM handling in the same functions.
>
> Fixes: a489afc105ed ("soundwire: mipi_disco: add error handling for prope=
rty array read")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

[Severity: Low]
The Fixes: tag has a slight subject mismatch ("mipi_disco" vs
"mipi-disco"); the canonical tag is:

  Fixes: a489afc105ed ("soundwire: mipi-disco: add error handling for prope=
rty array read")

In addition, the mipi-sdw-lane-list handling in sdw_slave_read_dpn(),
where this patch fixes both the -ENOMEM path (!dpn[i].lane_list) and the
fwnode_property_read_u32_array() error path, was introduced by
71b405b18444 ("soundwire: mipi-disco: add support for DP0/DPn 'lane-list'
property").  Should the commit message note that -ENOMEM fix and also
include:

  Fixes: 71b405b18444 ("soundwire: mipi-disco: add support for DP0/DPn 'lan=
e-list' property")

> diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disc=
o.c
> index 259ad98b5b7a9..65f8a41e6cd90 100644
> --- a/drivers/soundwire/mipi_disco.c
> +++ b/drivers/soundwire/mipi_disco.c
> @@ -96,8 +96,10 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>  		ret =3D fwnode_property_read_u32_array(link,
>  				"mipi-sdw-clock-frequencies-supported",
>  				prop->clk_freq, prop->num_clk_freq);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			fwnode_handle_put(link);
>  			return ret;
> +		}
>  	}
> =20
>  	/*
> @@ -132,8 +134,10 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>  					       scales_prop,
>  					       prop->clk_gears,
>  					       prop->num_clk_gears);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			fwnode_handle_put(link);
>  			return ret;
> +		}
>  	}

[Severity: Critical]
This problem wasn't introduced by this patch, but can prop->num_clk_freq
and prop->num_clk_gears cause a buffer overflow [1] in
clock_frequencies_show() and clock_gears_show()?

sdw_master_read_prop() sets prop->num_clk_freq and prop->num_clk_gears
directly from fwnode_property_count_u32() without an upper bound, and the
sysfs show callbacks format each entry into the PAGE_SIZE buffer with
unbounded sprintf() calls:

drivers/soundwire/master.c:clock_frequencies_show() {
    ...
	for (i =3D 0; i < md->bus->prop.num_clk_freq; i++)
		size +=3D sprintf(buf + size, "%8d ",
				md->bus->prop.clk_freq[i]);
	size +=3D sprintf(buf + size, "\n");
    ...
}

If firmware provides 456 or more clock frequency or clock gear entries,
reading the sysfs attribute writes past the end of the 4096-byte buffer
and corrupts kernel heap memory.  Using sysfs_emit_at() in
clock_frequencies_show() and clock_gears_show() would prevent the
overflow.

[1] https://sashiko.dev/#/bug/linux-6aa03701-2826-4725-b0af-33189f2d3db9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112021827.1835=
-1-laixiangwu@cmss.chinamobile.com?part=3D1
