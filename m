Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB829B78D
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482209; cv=none; b=Ouw01rVmpi5llvABV5wzzFQUJEpZdN1zN1FOdS2pcMg7nGuyu78fpXR9YAGirdyb/UZcR4HLuZf7t8q8Vmd7SjaIX3QNi8Indg5Ei/+4I0evj1uf1BdCEluXQOraRJuvbvHf576GzzCaYUjICkXF3fcyLeeNoljCIGI3rRZBLNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482209; c=relaxed/simple;
	bh=fXlDiYGjLg6saC+nl3nCrMfMmSmKcRG4KkQ8zTTFH7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6FrJjXu+4NuZ55qwslmsWA9tLsgY2hJHjmShpI/mreOm9lbXjTrmznatKntpsa2XMA+WnNVz38msVoGnGH65gJBbPyoVTcVJrQzLf2H5526QEz7Cws2cLiIjNLoziD5WTftYSBIKM4+uA35KMjpR8pxfRMthzjmXUjCGt8XLNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/jZYX+F; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/jZYX+F"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57516e08474so2517066e0c.3
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778482207; x=1779087007; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHCA4m/88VRKLEOixji4UKeMEx/F2Qqeb8DQm3PaHK0=;
        b=o/jZYX+FlB31Egsto7f7tRgl2zr3cd/dQTnxcrCrBGwqWoLxsWg+Uq7468rwwfoiOF
         wEojyrP2fBkuXWvrwKWVqQQG4KnnO1Mn+INVLpR6Zi5Rf98qPYoUbzumGDySftmFiQn+
         Fgnwn+1wK97JEZo2e+Uz1c3Oij5yp3u3zFzK9Sp8n+15yj4ZdgZab4QSvcBSYfOVY+dK
         y3swPDnUX3MUYIjMqXzBV3cjLw83b2igSQ7ZpOZy0dxt5XO0n3Xu0qjt/YM2IRFtBD/4
         Pl3TWUZEAodwXwI/W/PqvOwxEi4skwxz3eQvnENWE3HCoEAdr1Hbpfl3ULYdq6eay8Un
         iSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778482207; x=1779087007;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHCA4m/88VRKLEOixji4UKeMEx/F2Qqeb8DQm3PaHK0=;
        b=bi4ViKHG0kyAH4TUzZYSaXcoh5WvTMFt85pWPyN2jfR90/MhN9SViGAGeP+7p+akpI
         lKzW62Rji+SLTsr6eeYlL5fER2surC/MNgJNyXYbrWs5zWapaDUz6JvtxD80dS4VntVc
         JJ39IRLehTfzxm99fTX50M87ucdD/KB5V8SomfOSAdV9xbytFRsF3r58xBeYSGLR+d3q
         jo4GOvL8AP2kHx54gqEl9Q+wl4l4w5sj7sdGC+tZomVPgQIi+kOy7qGKf5zd6nZEvdSU
         /Dyp3/ROSDw9QRA13YKzcz54GYEQNuM60iZAk3u7rDJHhS2X9O4+bhO51BAKaNDaiiyJ
         Sm6A==
X-Gm-Message-State: AOJu0YyulxcSkCKbf1iO1wLrWCnJIHabbRLmn13WMSFz+Sl6pDmABOnb
	0jodyXWizfHWzoX9/o8jRE8ElbJwol3OLIdt6+12XeXXlEuYpv5flyjV
X-Gm-Gg: Acq92OHbreIzfAqAvgoRwctDdPXwBLU/7ksvGBZave6hXpIlz5DWEiwkFCG04n3QPLf
	5EO8yo6cUivM4Z+I4DnsXc/C9sGztMjXUFN4xkG/+YYbNQjA8YN59uRFr/ksRsRlj3fGcfnG+HJ
	FvP7MWXXUyKtL4GSJT2z/GvEjZPlYrIyHNiIRc3R0i/+5CoL3vfEBBfcML3FWebG6z5a7WHdJon
	QCioGuYsVI7tnKWcwEEmssS6n4UcqO6waoFK/QD46/ZHZkVftqsnm2w1w/85H8djYiU5GOHDPBw
	nKbBi/QH7ucEZy+ZUlQbXwEOwGsXxsVmPCWrLVAbp+fJ63WRZKRzG/FE9DyfwTJ+O3jgYLB/8GE
	3idMFg1AqvcHtPmFHld+CHVu7dBHsy2b8dDvawSkU89+RtJW112aOYh5slh4TfakuSJI2Nz8Alf
	3kgXWyoiYdK4tfEfT5imHiWJTzBrKk
X-Received: by 2002:a05:6122:3d01:b0:56f:a329:6859 with SMTP id 71dfb90a1353d-575595d0e52mr12020601e0c.7.1778482206964;
        Sun, 10 May 2026 23:50:06 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575585f72c1sm10813155e0c.12.2026.05.10.23.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:50:05 -0700 (PDT)
Date: Mon, 11 May 2026 09:50:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: sdw_utils: TI amp utility for tac5xx2 family
Message-ID: <agF8GBcHYUaGJbXY@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Niranjan H Y,

Commit e812de61e9a0 ("ASoC: sdw_utils: TI amp utility for tac5xx2
family") from May 5, 2026 (linux-next), leads to the following Smatch
static checker warning:

	sound/soc/sdw_utils/soc_sdw_ti_amp.c:114 asoc_sdw_ti_add_tac5xx2_routes()
	warn: why check scnprintf return value?

sound/soc/sdw_utils/soc_sdw_ti_amp.c
    102 static int asoc_sdw_ti_add_tac5xx2_routes(struct snd_soc_dapm_context *dapm,
    103                                           const char *name_prefix)
    104 {
    105         struct snd_soc_dapm_route routes[2];
    106         char left_widget[TAC5XX2_WIDGET_NAME_MAX];
    107         char right_widget[TAC5XX2_WIDGET_NAME_MAX];
    108         int ret;
    109 
    110         if (strlen(name_prefix) > (TAC5XX2_WIDGET_NAME_MAX - 7))
    111                 return -ENAMETOOLONG;
    112 
    113         ret = scnprintf(left_widget, sizeof(left_widget), "%s SPK_L", name_prefix);
--> 114         if (ret <= 0)
    115                 return -EINVAL;
                ^^^^^^^^^^^^^^^^^^^^^^^

scnprintf() returns the number of bytes it was able to fit into
TAC5XX2_WIDGET_NAME_MAX, not counting the NUL character.  It
never returns negatives and it's not going to return zero either.

This is just dead code.

    116 
    117         ret = scnprintf(right_widget, sizeof(right_widget), "%s SPK_R", name_prefix);
    118         if (ret <= 0)
    119                 return -EINVAL;
                ^^^^^^^^^^^^^^^^^^^^^^^
Same.

    120 
    121         routes[0] = (struct snd_soc_dapm_route){"Left Spk", NULL, left_widget};
    122         routes[1] = (struct snd_soc_dapm_route){"Right Spk", NULL, right_widget};
    123 
    124         return snd_soc_dapm_add_routes(dapm, routes, ARRAY_SIZE(routes));
    125 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
