Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C73DDDCC
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230765; cv=none; b=EnuOdVMQBww5D19uk7yyaLbX84tZzSwG2D6p8jj1+9fCDSbDpj3+hZzDNCFWZ3zpEVkGendn7H59badVsg1IDwBpLq28NtSWALvC6ci6iUBpp0fy6NhpoaYmbgm4hIX1RHYKd7GEG0+0l0u/NJoXA+KBZvXEq/8MuykQ6iBwiBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230765; c=relaxed/simple;
	bh=BRW3AhLw6lE05NYsx2G0Y6F8Dbv65AcPka+gQm4IJ9w=;
	h=From:Date:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gbn+xCgehLfjvxfeH0dxJ/LmPRPeIQ1QwHHhlj7jLEGH4MQqvet0pAjulAu+v04H2JQXs5FlizGI0DXfxljV2UpH9sLN5VE+ULI03UwBW5jjriB/LNvZ6cd/sEYEKxjvcBwCtAeVkXGZ/FuxfeA1R0Y0mVmdZi2thLOUxeZhAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=XD2y9AuB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XD2y9AuB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b93698bb57aso149133266b.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1773230762; x=1773835562; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSuccA88fM16vC2dm3kNbX/eCvK4B9XL7BzlwECAyrA=;
        b=XD2y9AuBo8I7fkue/Nrcv142e7dMjS5nMUaUHV+lU+5o3QV1KZTr+p+EhYxqaUFzz7
         /UK4VDh/bRgFx9AkG9B6ZP4GjeCwwQdL2oCk00mUOcZ8ePkGEipS/Z3XRbM6rcg3y1fA
         pe0dg8hr/UOAzc62id6Sl3ViJj0h+Kqw3VhbSCtOsKeNWtBXZ8sQWHFvxgurHOCt74lK
         euBSRyVXk7CoVLVn7WNDvTi/pks30iVz7RwTKTvPujLHKrJvXo4P8yq2HOeq1BScwm/r
         3Wcvck/8T5v5eKzTXhYDvO5J3XzLpmGetgs7vOXv5fMvkQ/j8V2fHbynnyPCMF19joRs
         LWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230762; x=1773835562;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSuccA88fM16vC2dm3kNbX/eCvK4B9XL7BzlwECAyrA=;
        b=r6CNJ+k8+ohN2lPxITWcHT1+4e8eoiEZXGd/PY0vOFCr86+4/1u6dvM1GGO32re7UY
         AE5ZAHmiyQVpXe9eSAdghfEXRLHC1IRg+QbEBxvMRJ5I5/jGuXuSggPFHxxBMgaJA2Q1
         Qqj5R1B4iJiU7dv+jthakWkECNLaItpF6gHJGGrqqJITRB4W/PiSJ8S6D06vsiAsHXNM
         ZkqdIgPq1MvQAp99QGS2x04DLMLEL/OXrJN8JVQOeJwnYGs/kSy4czxj0hqWP9QAqJwU
         vZgyEwlyNkgKRsgIIbn1Mk0nZSLCkjA6pAqTZ9rdJngEFd19WipLbxgLGL+0OFykY/OT
         KV/w==
X-Forwarded-Encrypted: i=1; AJvYcCXCsjVpTvjhFZzwOTSr8aB8qeZaRE+CgwU7BuXScDoPzXqOqhChKhiYWAA5I0yqGSmq8RQOwKYjmXVIug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmUWUxJiUV5BnB+X1ObWdSJ9ZPrQr9iBnWEd7OMzqd14v1Z0XS
	eaJFzUEc1eTJ5WNtEyYXv4oHyB6RtehRSTvUeShq1mqQ4GQxPiQs9olT5gLDtsZf
X-Gm-Gg: ATEYQzz7yMcd3j5uLHpLNZwhNwLi810E1cDX8f3v4hxN6MQfK/vh/xv6c4r76O6hqkU
	2Uy8uK25D+Ce0I7YnDDAHMzb5VyUOchEaNoHti3hP1w4fV4Vlj4N93usQVSq9W9x7X9PL05cNkH
	qdNQBfLgT/Rd/YoW/ZgWwHhQy6cPUvwBgBL6Aq4OdscOpUYxjbXXR06MwHwg+bjAE3mkVTkj9uK
	9i6l8bsWJLOuFW3IA5+f/Ty52lU0cGYZTu2DUaPhHo9l/pT/8Sba1vhYpvxUpj9owu4ouibOauf
	QSKxhD+7BaU1zaBsZHWu/QH0jlpgraJiM0O/R83plMfzDTfrv+2XJ7KTJghnShFoNxCJ1FIhSnx
	Rnmn9LwuLbYpWfU5J0s2Gd3lyEFHBS1gY5tKpJHgrwZSOrrJts2UGeSs2LliwzgIVMVizf09Bim
	LCxC09isjaKkZhvs22PzzTef2SsQ==
X-Received: by 2002:a17:907:5c3:b0:b8f:c684:db37 with SMTP id a640c23a62f3a-b972d5246afmr141023266b.9.1773230761694;
        Wed, 11 Mar 2026 05:06:01 -0700 (PDT)
Received: from develop ([2a04:1c40:207b:0:ab38:3efd:9ae9:eb40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14c45bsm49850866b.34.2026.03.11.05.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:06:01 -0700 (PDT)
From: Carsten Behling <carsten.behling@googlemail.com>
X-Google-Original-From: Carsten Behling <carsten.behling@gmail.com>
Date: Wed, 11 Mar 2026 13:05:59 +0100
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-sound@vger.kernel.org
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
Message-ID: <7asofwgi5xn2yux4nau7xvjibfokdzipxsmmjfkixs33ceguaj@22xbaftccepg>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cezary,

> Yes, for ApolloLake (APL) devices the avs-driver is the way to go

I got this answer from Peter Ujfalusi:

> I'm not sure what you mean, but APL is supported by SOF stack with IPC3
> and sof-firmware package have the needed firmware and some topologies
> for the platform.
> I'm using SOF on up2 board with HifiBerry hat on (PCM512x).

I thought SOF was dropped only for CAVs 1.5 (inclues Apollo Lake) due to
this SOF commit:

https://github.com/thesofproject/sof/commit/0f0acaae94ed4cd3af907584ea89fdee0581b0b1

AFAIK Zyphyr RTOS integration and some other other issues made that necessary.
Since I don't know what does that mean for the kernel drivers I'm still not sure.
Where would a new Topology M4 file added in SOF supporting a kernel SOF driver?

> Fortunately, the avs solution does allow for
> including such details within the topology file. So, no BIOS/ABL updates
> required

My last observation was:

~# dmesg | grep snd
[  409.596006] snd_soc_avs 0000:00:0e.0: failed to config codec #2: -19

...
static int probe_codec(struct hdac_bus *bus, int addr)
{
...
        /* configure effectively creates new ASoC component */
        ret = snd_hda_codec_configure(codec);
        if (ret < 0) {
                dev_warn(bus->dev, "failed to config codec #%d: %d\n", addr, ret);
                return ret;
        }
 ..
 }

triggers due to no Enpoints

in drivers/acpi/nhlt.c:acpi_nhlt_tb_find_endpoint

> Using phrase "dsp_fw_apl_release.bin" explicitly made me curious. What
> binary _exactly_ are we talking about here? The avs-driver _does not_
> expect such wording, neither did the skylake-driver.

I meant most recent

intel/avs/apl/dsp_basefw.bin

from linux-firmware.git

Best regards
Carsten


