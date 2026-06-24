Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85E02F531B
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270848; cv=pass; b=VPWEa2cLOA4qtDca9O1EJV3kTUJOh5lO//yYrV4+tPlQWVJrqauWhBLL3CWzFeWwyCwgIOciuWyiz4FXmjcxuknl24FL3mOr6PK6R1VnzSoI6x57PG1rHNNcCrWwIM7mGM2or0gJbf7C3SGI/9M0ilcju3fujQgpVscIVj1Tzq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270848; c=relaxed/simple;
	bh=8uH/R9LmqjQ2JrT2MAKBkOy3A1i7lG7XyHpodjES60g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=joKF1w1Vt1T6iNAFAS/GdI30aXwbPgBISE9ibekN1JNpvTnTqoanG3OCf/to18NLcU+V8updnDBA8ddFIxElIWYeryCpbGDsRrl7vVCv8HyDBFZHj2b0WwPbOEaBzR+BFxpCDBrHsBxrbicQyRdv3nY5NQUIA+pF6yicI0d5l2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYlpELeH; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYlpELeH"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso177213a12.0
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 20:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782270847; cv=none;
        d=google.com; s=arc-20240605;
        b=BL12IgYONXHA44s8zHdgaWpV+b8khKXpk2bzV5QBcugk8j3d2kZ7tOLp+O9JKlDt8W
         Xar2PerfSudtKLP37/EpWtfJJj5NzOqDte0sQGhFpFKuCO3ZH6vVQsMQskBBO5oEpg1D
         7sRTOkbksX66qpw2vXjwuz9LnGQUzSkbk7RSt8TtuRLO5pMstQ/wuzF+KDFc/ymLdWmb
         S3u0VvCurK7n5+/M427fR/Dz7ubnD/Wk56pD4jPmUIj8nQV6uXCJbAMr1CSNEsSz0IF1
         5CST/5XfIqEqgGUvdhXluvTdbsvpUWBGD2XGzqNMAflIRmRiIh9Zd25zUiC8XvGr1AZL
         L4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZzXshTyFfjoOD7FbJbD9D5BnzBYBvNPuk0I3mROYXK4=;
        fh=KTpDrVEvxVIZHAgk344okbp9svCjzzoH4LpTHXHMV/0=;
        b=EvSSQXiIuehfazgXXih2WHDXpSdig1sL7UZBaurCUVj7MBjASbRuH6t8qzQ55lBvAa
         QO0jlYvqJ2BQYbYp7lzhPgJBarRBhUpvZEiN52e8+DhnWF0zP+LUuQiXbD7gSJqbZ30R
         EMapmuOAKqT+rdZLX8nb+HNqGw+a/SN5+4X8JxO/pNwO9Y84xHhXX6DpCoKtAtUTc1s3
         GJMa4YskwGdb49X3CFY+8FOvwIHccKRZjkqzYWeJ8ORqynDiKbHr0CxheTyJzORUlJS9
         gYi8w/1SbCQOnOwx5GAYB3Mc+ugrEeTzzKTErk9sQ1d39f7kdrv0bYKmmf1snTUBhUfF
         pPeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782270847; x=1782875647; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzXshTyFfjoOD7FbJbD9D5BnzBYBvNPuk0I3mROYXK4=;
        b=WYlpELeHbN+DCGE5/TCfNtGXSiK0JqLFC9ZBa2i1hahU4ChLuagA4yjtP+mJ3v6bFN
         S7+g745amciBQOSxJZKL1k4JVTzWPLTnKGsRsEq1tGjCaO9vz8IpdtZts2UCiOV+XqZs
         Oy15UMtdE1RSWeoxvkTBoCQRNfWGDbSdNtmWzD4WxYZt+Zs9stYuV80W8FOmboTCtlqU
         NkpPIJBVLhEITBZH/znw5eDerhlztsi4l+W53gNuqxRpcivsJjyy0peA1plHV4TFitGJ
         YS+VTSiud868g+XIPsQwTtHT4cG+WVi8d6E2CrpmkyouMwE0RFsDpDOrwHf4N/lk/glQ
         zIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782270847; x=1782875647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzXshTyFfjoOD7FbJbD9D5BnzBYBvNPuk0I3mROYXK4=;
        b=DIIWsSo5VbwE6RySxWxMQc04ukKwIRElwxvadbAEaVfTwcS8AsQ1w9sZLFGad/bJXg
         avuGSRDX6C4pmxUfIzd59PLqunoVxHz0MYE+tWQfrueZIX5nGLbkqc3GDjvLmwZ3AcB9
         WKhfkwHRLx7ItS9+8SN6TSObtTYsDX1W/+Bw5RICnaNOs6yW1oAditeasyqgtY8mA955
         9UqtaccUltJSvZTsw7h+SrDxfodgErlUIokikf8lXR+OOhWJ66rgPKPWsb2VjiRtuGO3
         kWWaZ0BIMl22YvAH53tfddmsepTbO2vftQ6ZQ284hZ/nqgmlUa+XdV77xync9eroNmE4
         OHWA==
X-Forwarded-Encrypted: i=1; AFNElJ/UWrsc5EIkrT4snvS9ulMIAGLdcO4sjGw8g76aufua8Q/HMQ4i2Rr+n/64eROwoPRUkiJIkJkDRtX4pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Kp9F9F8L9Xg1ga8KjYSXU+0GBoYWRiHHSjTQK2/Zqj9XKrQp
	JeY9Fiml5XeKB1a/UuVFdyluXWRQl4SiujKo95EZPscmxWhdR52SH06tLRXHeQ3+Dmx/tBHaIkD
	GQDhTZd0aL7nB2+YOhnDpSkQyjARJmZY=
X-Gm-Gg: AfdE7ckQ100+fixlKUj5G2Pyq98i4jSt/yCoKeifbCRkESOLRVb7sV/YvFdsEoY7pd8
	UiyAVMOOXdiQdkzALxMEMlRngEBa1SmG9juulqppUKFSV7RO0fIMexqB+NHCJIiBPjk31gNcD05
	MiVmumpqxgn1Kwz7wB9vhey3eJ4Iq+hehGiShhAS74uKaf5Zi+I/oLb0rH0zRe07lfRXhzvMWLg
	Z1Z0tD4NgFHPJs46umBNvBfa4GhJThnZUIW0bdHKK8c3Ez7vsCHzc7AGGIaCOhdzw9Qm0yvJYxi
	jzyPUu99cUWmv9YBtUZ+wDj+UlQ=
X-Received: by 2002:a05:6a20:3d22:b0:3aa:c964:3c27 with SMTP id
 adf61e73a8af0-3bc5420cd6bmr19655552637.46.1782270847072; Tue, 23 Jun 2026
 20:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623105721.25865-1-phucduc.bui@gmail.com> <9b332fe4-ed5b-4e29-b607-2850a0789929@intel.com>
In-Reply-To: <9b332fe4-ed5b-4e29-b607-2850a0789929@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 24 Jun 2026 10:13:55 +0700
X-Gm-Features: AVVi8Cdy8xl5w2_s20ek9QtGTepxp7dJwTD-P-fnZotRG5p_glZrJJGQ6NcP8vU
Message-ID: <CAABR9nGB9Z-caMwubqNAY1W9OwM6ZiFWqrqATJP9NtyNBbkL4Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC: Intel: Convert locking to guard()/scoped_guard()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Crazek

>
> The order is off just by looking at it.  On top of what I mentioned in
> 1/5, please fix the ordering so that both avs and atom drivers receive
> updates in the same manner.
>
> TLDR:
>
> 1. ASoC: Intel: avs: Use guard() for locking
> 2. ASoC: Intel: avs: Use scoped_guard() for scoped locking
> 3. ASoC: Intel: atom: Use guard() for locking
> 4. ASoC: Intel: atom: Use scoped_guard() for scoped locking
> 5. ASoC: Intel: atom: Use __free(kfree) for stream pointer
>

As mentioned in my reply to patch 1/5, we cannot place the __free(kfree)
patch at the very end (as patch 5) because the locking updates in atom
still rely on the goto labels for kfree. Moving __free(kfree) after the locking
patches would force us to temporarily mix guard/scoped_guard with goto,
which is highly discouraged.

To keep the driver groups consistent while respecting this dependency,
I can reorder the patchset in one of the following ways:

Option 1:

ASoC: Intel: avs: Use guard() for locking

ASoC: Intel: avs: Use scoped_guard() for scoped locking

ASoC: Intel: atom: Use __free(kfree) for stream pointer

ASoC: Intel: atom: Use guard() for locking

ASoC: Intel: atom: Use scoped_guard() for scoped locking

Option 2 (Most convenient for me):

ASoC: Intel: avs: Use guard() for locking

ASoC: Intel: avs: Use scoped_guard() for scoped locking

ASoC: Intel: atom: Use __free(kfree) for stream pointer

ASoC: Intel: atom: Use scoped_guard() for scoped locking

ASoC: Intel: atom: Use guard() for locking

The reason Option 2 is much more convenient for me is that atom has very few
scoped_guard() instances, making it very easy to separate them first
using git add -p.
On the other hand, guard() instances are quite numerous,
so leaving them for the final patch makes the staging process much smoother.

Please let me know which option you prefer, and I will roll out v4 accordingly.

Regards,
Phuc
