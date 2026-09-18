Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498C4C227C
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729198; cv=pass; b=mPPNOX2P7YV/kGHhpvTB5L4cDyDDUWi6F9M05kNoBOXwwXbxrohWZLkrDslLknRlr9LXLtKDL8OyEAAQKp+hvoPTfxYLca4MHdBNN+r7hOUsowav4ZWfGIuPyNdnwB2p8WApvbdgVeTNNUwOe9WuvVWbJBK2lq/m/PGPPjmwtXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729198; c=relaxed/simple;
	bh=alnnkH7WGWsawf5VvQl+bx2GHauHyQlXLyt5VyewApc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhaU3Ac3UZmbGAyEKJvTh0r5WR0G1pQfTd0s/iGDdwWDBQlk8+S4bxD9TMetrHKkMW42wqXhxaA+T9GUTR7TPGEwFfk7zphxBFtpzAZO/Haw3yjajC6m1Y3QgkatnTGASzq0DBFlyyaVwBvdgzI4cQ2jviiJ36ZkrF8EnJapoPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=Qvsbxy37; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="Qvsbxy37"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d440939f0so4623177b3.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 03:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729195; cv=none;
        d=google.com; s=arc-20260327;
        b=FS9+va679ZevUR+Q+LOa/asjrRkMtyhsT/5dlyP9J+ibV41BF3xZsu304ZolVa626Y
         R61boxxR526mNglRv0v3HMhatuhAU2uRVIRYwJoRvHXcPqIahBYnAbEEl7Naq1yEqonM
         bLmJi8ZSJQnGh5RPidSuycc3WgDA2GHXsdbArPPEjK5VdlHdtP72JQW82Do37YGnOlHX
         ezoJVAFoX/pFpUmijEXVwX4Wt0pDpN7p+DREPn1PwSuL2AM7Oy6d5r2t1YyQ4zKAiIYg
         HZw/nngR3QbJTQkTYJgJBotLmWcwrYrO10MllL3EJwKzwxbYsfp79iBD3/IRGB06R6PF
         m6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        fh=hlliN866ZPiPe9AVIevcV0DeKz6XVA5jbklZe9QTip8=;
        b=ruWQoN2iYnYS3+CFnYwxVR/hoRCQG7sN0slPPN80KQNWZzOgDtEAW/5Xsa7W4FNgcM
         cHU7HRcenhe2FNesFlaDZrmL8EVCyF2aYWQAo2qhGqIZ++asjmGiFyFfDP69A8VAPhLR
         r9CjwWi8Qha5Q/kvGZ2t7pxwgL+WekLdhIVU9dOymIx+i5j7B7dfNBcH/JtxscgYLjOq
         z782a8y8es9d3S2xnIQob0lECFHX6jLLkTMu3lAoBvqVth716ILrtlbpTg1tAVDuHvnl
         2DdgkXq+62xQSVJfeAOLPja1wkQ4S0JKPglbI937R0QlLmSdkN4D/hm2wDDeusZ53OYP
         8oWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789729195; x=1790333995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        b=Qvsbxy37H//xJ31u4JoC+be2ELkT9Z6JgjPObo7Z0QsgAau1q7aG1DoVjXD/w2c1et
         o5Zbb5Ho1xS9+tgRi2AN7Tv/N0WbyWcHyTgTnl1fDO5VdenHaWs7BvmINjQbVsfWXl6d
         /zQB/VheRW2o1FJ9YONo25kyuWI4JX2leHzge6L/ofZtgavGKd62pwhS6v2Jh37am7Sq
         zUNLDxYJ9YpbCID+CC+g1lGGZgPu8A6HpLnkpoGnqw5nJehJfkF6YXjNE6Zzxu+ZqE8X
         274kw/ICBAwzw9hjGG4XWS8GYN6PAE6iKAyI3I677ttC1C3V3dqQEnjru40l2jZu7ZEV
         gYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729195; x=1790333995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        b=cijZS3slE7Liy/JJ2WQWQLqmyjr/iEinhXqZdgBuvJ0rBVh90YcGUtrbVDsWeXV0te
         7tCFZU4C2jO9WuAM9o4otZKzMJh1A83TYQaZJsIJmCruGY0UdryCU9N1K2CcMuUqjNQ6
         LhTC+RAi9tufzHQFnkm9/aN2a9lwZSHVhN8ju9qAM05YXfYpd8SR20/Cu8SsRmwuCEoR
         8bu2hUwmq3khxmZp17/9jOcjpi2VwBIC59XfTGrZxpY6TADLd+gYsId9I0xhSW7nSt2T
         VDy0qO5E89tpWRLuZLSI4hJtdM3beIkZjvnbZywEAE4XOEUSwpeYJwLyu1nJru+tu5Jv
         iFFw==
X-Forwarded-Encrypted: i=1; AKwUvBw8MeaVJfCRDq04EPK3X8u+yKtg1FqK5fcNaGlDLXUrBmsVqAhUatCl0ns9PaNEyX6FTsakafE3+Vzx8A==@vger.kernel.org
X-Gm-Message-State: AFuF++ll8iUeJBkLH3X7Lx/PtFVveKmWKbE6oUPDfsuuull+6O0nItcJ
	cFhXZITjwdta6+z1CgOcKICUCeikMtHhUSAkGr9biiSYuftenp6WAnnB6IrItyabqK49lkD1qxW
	zh5WW/lafF7sQ5doB3HgBOZyPKh2kNIzldnRgr1iE2A==
X-Gm-Gg: AYBFou0ZQX0G7wcbOYXUkiVc29KgBOLntK0uF2CFq80Zg2X3ODw6EWructVVrfXV1h7
	g3VaLwAZSMSowemYTOmkNfSHVwji+Am9B9miN7duHZa22a8sqAkOqHb4Aek65/y9ufzBOo8tGIp
	UpyPp6BLbLcisehVaaNVNnq2I+rKvlMSXFt2bpC87+ooiAMK7xtucUhy+vTW7wUrANKiN0zKzK9
	CCSLmPlzaA2qPXsboTA+ajDCjC2xE4LluZcI8ml3aXkdo6wtTdUluXQ5EyhG3EZ1cQMQoOWkFTX
	O+wArktBlmjKTiGrs5PN9ORl3MFbF8xA3D/L98xRe2V2mZxprA7aEObjauW5DsNwbrgX+Ca40VR
	OWsGNjQQw5Eb+XQ==
X-Received: by 2002:a05:690c:e0ce:20b0:873:5bb2:6c19 with SMTP id
 00721157ae682-89736b3f7a7mr4725497b3.67.1789729194857; Fri, 18 Sep 2026
 03:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918031326.68542-1-karl@asseily.com> <20260918031326.68542-4-karl@asseily.com>
 <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
In-Reply-To: <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 18 Sep 2026 13:59:43 +0300
X-Gm-Features: AcwNN1VW_L9A_m2ilmQ9K0WM9ssAzHQHLSHz7CCRbfwgDzOxl-iZROlyG5jgDeI
Message-ID: <CA+gvwbrep8j5R5c2o+oMAK9NF=K7EcXFswNCfaVnmfnsBd4v9A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +out:
> > + regmap_update_bits(priv->regmap, ES9039_PROG_RAM_CTRL,
> > +   ES9039_PROG_COEFF_WE, 0);
> > + kfree(buf);
> > + if (ret)
> > + return ret;
>
> How does this work with suspend and resume if the device is powered down
> in suspend?  It looks like this is doing some windowing stuff and needs
> a specific write sequence.

You are right, and it is broken as posted.

The coefficient RAM is write-only: PROG_COEFF_OUT is documented as a
readback register but returns the last coefficient written rather than the
addressed one, as the commit message describes.  So regmap cannot cache it
and nothing else in the system holds a copy.  On a board that keeps the
part powered through suspend nothing is lost, but where the supplies go
away the RAM comes back undefined while regcache_sync() restores the
filter selection from the cache - so selecting the programmable filter
would point the interpolator at whatever the RAM powered up holding.

For v4 the driver keeps a shadow of the last upload in its private struct,
the upload loop is split into a helper, and resume calls that helper again
after regcache_sync() for any stage that was ever written.  Stages never
uploaded keep the part's own defaults.

You are right about the sequence too.  It is address, data, raise
PROG_COEFF_WE, lower it, once per coefficient - a per-coefficient strobe
rather than a gate held open across the upload.  Splitting the helper out
exposed a second problem I had missed: both FIR controls drive the same
address, data and strobe registers and nothing serialised them, so two
concurrent uploads could interleave into each other's RAM.  The mutex that
orders an upload against resume closes that as well.

For completeness: an automated review on this thread raised the same
suspend question a few hours before your mail, so the fix above was
already written and building by the time it arrived.

I will hold v4 until your review is finished rather than resending
piecemeal.

Thanks,
Karl
