Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81F345CCD
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207769; cv=none; b=buPLTkCMI2s6Vo6TlAWsHD3yyLLfS48yqLJpi3d0FeTFL/nITB5MLQp8+WqLdAGBnTNlIEc4lFI+s28w3D2XXXzdraiVfy46ufmKJVH90PVUz0trvpnT0vPKZM8RwyoQfPFiha5uGeHR6hI6R4YJ6Eg2+X/VbrBc0qx98RrTmtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207769; c=relaxed/simple;
	bh=h10s5/HW7aqFZlO2ki21yW9EFRy51rqvbeI2/xs+6Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqggKnG4W+3fXpp7o/D/zZfiFju4GMD0kI+B3OnCZNTO8LoH65GC3KhFdHw6s48eh1ioVOhpenn9SdUIR8Ir5furBmLrvaJdvshXowFgZpfnqTHv45wn0KGcTju/qQvlVSnvWHaz2Za+EykQvA1enM6KaiTm/QuQGFHmhn+wbHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fS6RO1JB; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fS6RO1JB"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so56645365e9.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 00:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768207763; x=1768812563; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOMrE+myOP0LrQl1OVUBU894BVCq+VRbLawR48Sw+9o=;
        b=fS6RO1JBpa/qoOaKtNnPwB0gBNA7CEcBnAMHh6GMRYRdMNlKxCZT9XHwHG9H/+fSyo
         888cDtQnfRVffSA8V7JzBkpZHBjibJrcgfhGSGBCh0m7acx46xflHH7PEIt8fTEcrvQN
         Wfqr44Qt8YnoKwXqkCkiTSHvYt6w2D94InevtWEuE8FWrehfBjhDPifOehXaPwigqtrH
         y97BGalS8q4+KDTI+6FhzWCzijRM76Qe3wPojDFMjhiR/JEv5HEyqFF72WG2vDNgT4Rm
         5XThpMRYg2Ack2ogJjuKxqQj8KA257OYLDv8JzToXyuHnSdotrZl/4F1RYD4t+IiwR/K
         U+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207763; x=1768812563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOMrE+myOP0LrQl1OVUBU894BVCq+VRbLawR48Sw+9o=;
        b=XRhj2zci2lvomvWaw73A4YXsSsWhp+/QRgSH84kp+YWGxr8hP6V5J2+r8ZgCTLaCqy
         Ubsvf6i5ZnG7aCq11xhlGNTa2gJIOn3zOHt8lkfghySqX7RxdKSVt+2lzFqdxKia2MwD
         PeXF2XoQ1D+wue9ZRM/COBrQ1TBi5x33SRnrJJI4YRzt0bmeP4Pjqj+VLhzBXvdU9Spr
         ZYt4z8B5rGFjBctJNu8Y7T/TvPdiW8PTchCqXZhDskgYYVlJPNJHTmdlualMdJIMN6Em
         vLebPLtSn/uEYe1hiKWlnu06Q7aqn/Mk/FqIFdmk42onXBNr9S1qX5MFP2xkFDuyn+YN
         7xmA==
X-Forwarded-Encrypted: i=1; AJvYcCXaX5bv9hGQwm8DhiPp4CO9bnlW12/YWlqHLP+5yyYByqzuEyukQjzjxUvfI8q8R3nCEKR86Hycu5oMtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBUnPCHaBel8h/+CUZINwdAstvFe8orCdAmo7XrEgyZRRmbaF
	w1n/MZKc1NDrZF9GeFNmX24MErrGirq5J2Z/x6Sh2OthdBxQdXIC9STLBUAPd5Skoio=
X-Gm-Gg: AY/fxX79S8hdGb0era7O7sFulISuDjFrhQXemOBjb4TsYZIiFFM9Smw3Yz4cMijhrAN
	Z/48l5DK+OQFofUvzMz0vkQTuVqnqQFbKiJ7+VTvfOsF8ptWQlFPiPmrEX65kIB+3ZI5aZB1h6M
	k22yLVcyo6btWtJlGZoVXOlIN62d5ARGBxsOItA4n2fOflpeHGFw3ejqYZZDQ58vRalmvgEt9JB
	Jkqawaj1UQg9gkQ86XtdXKHZ/pbikKMUAKWLgZUUsvV7GmhWVwE3fXQHhMWtNvzKA/zJCUQfeko
	B2nqLKOPeaplOufW+jSiJzIjJEhxl5k0VsrU5/QxX0mWXkv4xAy9K3gJSypXcmD0/VOTCZ1MuY+
	YdmPY7GJ5rCLoUixr3MB5qZngEIZESqmvxFRq1JqHAGLH+/r7xV6fRLjUjo16ZDq/HOL6q6pO8+
	Ax/CQMRvTKulVVzCLI
X-Google-Smtp-Source: AGHT+IFSkZ9Bt+jF8EteEZVt3riac8CY7G/+vj9cJ7tYZqvtQj002QQ39KN6Q+Ht/zbeRDd9tCK5Kg==
X-Received: by 2002:a05:600c:1e1c:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47d84b0a211mr166896665e9.5.1768207763187;
        Mon, 12 Jan 2026 00:49:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm38391032f8f.12.2026.01.12.00.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:49:22 -0800 (PST)
Date: Mon, 12 Jan 2026 11:49:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vinod Koul <vkoul@kernel.org>, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, lkp@intel.com,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soundwire: bus: fix off-by-one when allocating slave IDs
Message-ID: <aWS1j7IdRLCJTj1h@stanley.mountain>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
 <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
 <aWSwS0PQHumb2TJG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWSwS0PQHumb2TJG@stanley.mountain>

On Mon, Jan 12, 2026 at 11:26:51AM +0300, Dan Carpenter wrote:
> On Sun, Jan 11, 2026 at 10:27:08AM +0100, Markus Elfring wrote:
> > …
> > > Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
> > > allocated, but the IRQ domain created for the bus is sized for IDs
> > > 0-15.  If 16 is returned, irq_create_mapping() fails and the driver
> > > ends up with an invalid IRQ mapping.
> > …
> > 
> > See also once more:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc4#n659
> > 
> 
> Markus, please only comment when it's a bug in the patch instead of
> wrong advice about commit messages.

Sorry, if that was unclear.  The link is a real link to the documentation
which says:

  - The body of the explanation, line wrapped at 75 columns, which will
    be copied to the permanent changelog to describe this patch.

The rules that we write down are simplified guidelines which are designed
to be easy explain.  75 is the upper bound where checkpatch will complain.
But I think line wrapping at 72 or 74 characters is more common.  Either
way it's fine.

regards,
dan carpenter

