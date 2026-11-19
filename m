Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108981;
	b=coEVxpsX2lT7Ov7CzSXj7QpUjWGSYawq4lKwVPnNydwa+ebzx2glW5YEWRXl+OWRgwd1
	 UePgskekhzW8fIel/+iU0eZQl20xrtnR3C1Vax7R3kevRlIIsPMiJc5qcaw7EG2ctLQrr
	 NChk33vzUHifgze2lBJSf4YOJ+9w98d7FPmQkYcp2ULe74AAdZqqSQBCIY4LjQJ5UAZH8
	 A0NBX3Lftzu0kUv6NPDeqDdOqDOWQYui9D+5JTpIgsS7WhdYxzebz0jmefCQ/wtdX8/XL
	 7GeoPgOoeFETp2JP74WDIDv0SxZicbbbut3KYT4iktW0dsG2mDe+EwxQeG9v0Yc8fXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108981;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ApxVElpChe6exJ3vsEjvTGCXztRbtPqu8cS4XRCfdBA=;
	b=Fz6SwajsOpAkkuFvdZRMHsKcEgq3OYIRVRrBuT10n7gXwtSyCuMVlqunxpEMY2JAwFLu
	 puLzAIuhEmBNti7YGGRKJK1GSfEiZp6RwF22I0FgxMWQP/0QH3tIrabpKZw5ZO4m64zIy
	 vduxlUuWAkA3Gs1UcHIitEKHgzVMCLNBkkQiEAwmUqcqqx/qW4LorTSlmT78hEnQyxEm7
	 p88qJa0b2TCOgnBSqK4dKaqjyCgczgVWlU4JMIE3QhYMPkq8Epr3GLn+mldT4jUuxsS7m
	 n7NjZe2c04/rlzbi+SK5cGf/ectCZTQ+EB9enmtNxUnUdOh8QSDsIq9cqxnZ0Q9OrYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fn1MVOht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730C8606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fn1MVOht
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D021F000C4;
	Thu, 19 Nov 2026 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108981;
	bh=ApxVElpChe6exJ3vsEjvTGCXztRbtPqu8cS4XRCfdBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fn1MVOhtDyt2SdA/rPU/RygUI9DVWekO/06DdfSjYAkQFBFSNXVhvq96tiwb6Vv9D
	 8IHLHmYsTvofFMG3oXkLKv/6vYvVmqA1Ye93ALiFx3ucK8/kZSVXts2D6ryq/rzpuC
	 6OpEzbWRCOwExHYK3Cg304T9r3gcWCEfsaiERBqnUB3a2hRchi1nvE6eA70OOaBSsY
	 c5Aet6nEiHiXoTMl5UFpRyI2SWoV0Kdo7IOhZaafpEpcbcXxTE1XsGr5JQbN3STy4o
	 ZNkscqf54qW//cEvnRvvkL/AeccB1d2hO7ARU1COJAYw9dETLHw05AdMbxngn5Txza
	 rNZwwWNhX+5IQ==
Message-ID: <sashiko-outbox-223688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture
 Volume handlers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ian Rogers" <irogers@google.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261119170656.1522183-1-irogers@google.com>
References: <20261119170656.1522183-1-irogers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:23:00 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] ASoC: codecs: unsigned cast bypasses bounds check in
  set_gain_put() [1]
--

commit 6b4eb08972e9d693f4ba90820d49635baaaa320b
Author: Ian Rogers <irogers@google.com>

ASoC: rt1320-sdw: Reject unknown dev_id in FU Capture Volume handlers

This commit adds default branches returning -EINVAL to the dev_id switch
statements in rt1320_set_gain_put() and rt1320_set_gain_get() to avoid
using uninitialized stack variables when the device ID is not yet
populated or unrecognized.

> diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
> index 19079212ba6c0..6724012d5c09d 100644
> --- a/sound/soc/codecs/rt1320-sdw.c
> +++ b/sound/soc/codecs/rt1320-sdw.c
> @@ -2829,6 +2829,8 @@ static int rt1320_set_gain_put(struct snd_kcontrol =
*kcontrol,
>  			reg_base =3D SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320=
_SDCA_CTL_FU_VOLUME, CH_01);
>  			regmap_read(rt1320->mbq_regmap, reg_base + i, &regvalue[i]);
>  			break;
> +		default:
> +			return -EINVAL;
>  		}
> =20
>  		gain_val[i] =3D ucontrol->value.integer.value[i];

[Severity: High]
This problem wasn't introduced by this patch, but can a negative
ucontrol->value.integer.value[i] wrap when assigned to the unsigned
gain_val[i] [1]?  A negative value from userspace converts to a
large unsigned integer and gets clamped to p->max by the following
gain_val[i] > p->max check, setting the gain to maximum instead of
rejecting or clamping it to the minimum.

[1] https://sashiko.dev/#/bug/linux-4e6d0e9a-edf1-4f06-b366-c7939979db0e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119170656.1522=
183-1-irogers@google.com?part=3D1
