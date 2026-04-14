Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDB39023F
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776169826; cv=none; b=ou8ZjR+1DCyzM7yMlW3obWl5pc+CQbjvkRVw08O3Gieplp598u+2XmV5WFQ5NaF2DkZgUewyRBkDhOz46LhDIThFC419bAO96HI8j9JcOm69qSkkm3kL/7Sv3jb3jmGDsjyK5KF2SZ1fl1PblnXzbCE08xIS6JNDkturmt4RMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776169826; c=relaxed/simple;
	bh=G5S2rSi/wpBEfLJhZeFgnaXuANwT5CQ1GVZ5jmoSqLs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwXeKtC3UtD1eeeEfk82sNoK75L7p15bXTiAYeWlZoMnOV5qitA+lDz7hgksltzhW6YeMrr/7K/dFS14WnOv+biUZ3FeF4FWwImXSrGU4Ph0kI8zaNHEysQmDK4ZjddLiP+baephwUs0adEscJQwN0bZI8aKoeVhVpeCAIZpolo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=VopKz7IA; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VopKz7IA"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8d424af6282so598645785a.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 05:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1776169824; x=1776774624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mkdYECEktSpjrocdcTryUzd8ZDDwZWJZIWWkedU+ruE=;
        b=VopKz7IAW9jJSklxzld45wiaWGsFgk2W23FfUTi9koptPznYZACD2hIm2WYHGSX2oI
         YjyhO9da6Q/k/EpDfZeroJKaeSmwnapqN8TATXginah3gTrm0YZYd2QoqS2cdmuYBcGA
         /w2jF7mioTZW8MZyy4eS1JQGQ38CURsGHS/Pm1u8mUG4adB3TKnSXubK5+OM+74aFiXF
         ACrdTCbyw8sk3nsvOGKpzRYfhpSXqwQ9B8vji2xUNsRdAgqKwLE7d2uQ9ygt8tHF9lOU
         dUA94ZSysnlAI7o5C1o5JtFcUTHPR/hzUJrvPULl9aptsTH3nd6JpoBadh3Hon6VvOtP
         7p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776169824; x=1776774624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkdYECEktSpjrocdcTryUzd8ZDDwZWJZIWWkedU+ruE=;
        b=ci8gevYnTOvWnht7eZjgCDKPFFd9hYhV31UET71FjGtZAjeNAODO/5vtznhd/CKJr/
         WeJIejKScYykv26S++jN488fH7vJjAEEhBUrf7gGw4qaFZpseC9/j1zI9Sm7ZLwoLg8N
         hhr0Xepht0YnKm6Qx/Ncf1pNfav/zncNwgTZQMfrURRGxvjWnlPEFxPVlyErDMghFE8w
         Wgn73/mpfjdS3qsxyR6vzcCQ1Mca6r66zgODJiuWflNUkFYbPZKSYYdFH8jU5RhKZY5R
         lIuf8hDngN7JCbMdL7n4R3/Yj7fX+PyVOlpCKiB72bqUP3q0om+oK1rlQVIkk2w3uq5Q
         thtg==
X-Forwarded-Encrypted: i=1; AFNElJ9lXG8uQRZ1nGmWgiXgNvhItH0Jl2xsSOWuIP4TmfVAP1k568NLkqk+CfoiL2xbY3FZUkgw7OBuXERqEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYwBhvTRBsoaa24lwhI82lusupzP9Q3GxAPgErQKB7iporwCx
	PhdF/Uec0t5KKMkMvm6MoFBaSCXrp/d6P87yphK+BQFoADXJAvFBF1rU
X-Gm-Gg: AeBDieva7Tj85vbygSMQE+pluI8+FE8SnuHbZn9SoETpIOSd9Ef1wc1HwU5tkXwGczb
	GdrZfeGNVLoEYfxvAG0GoHvmgSUAbDoP89j/GABnxDJa36Fc9LifDR3CBM5rQPpYS63wNDKSpMg
	j9XM3flaoj3ZozmEIvzh+Wy+KdWsrI/Dr3PSNyltiY1x8Tym4QHy+zDBUhsX5fpUcXu2LgFT/VA
	FSM1e1U0EsNKI4cviFyxRodwE+auJexfaTAVRiauF1rHAQ+nhANi5l3RVvJxPEO/a/1nM1VJo3r
	ZWB+5BE/gStcBGQOZ5xyuIHNFQ8KxoXl/3kA3k0kG11N10pffDjeKQ0kbQVW3gYMLSPGPd0TXth
	JVZXFi7G582dp8eU0IIV3frzmfNsT6id/ILYPEm40w8r27AouDjzCrHyl7VSH4r5wxQKPQUYzKu
	xTml2iJoJk322U7tau5f99GoviOMw3dOp2TFIaRDsSK3hDdX/63st8cgZt7g==
X-Received: by 2002:a05:620a:bc9:b0:8cd:c03d:b6db with SMTP id af79cd13be357-8ddcfda8ec6mr2490197385a.52.1776169823364;
        Tue, 14 Apr 2026 05:30:23 -0700 (PDT)
Received: from cabe-ThinkPad-P16-Gen-2 ([2a04:1c40:337c:0:71da:305e:7156:ae46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e13fsm1125285585a.23.2026.04.14.05.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:30:22 -0700 (PDT)
From: Carsten Behling <carsten.behling@googlemail.com>
X-Google-Original-From: Carsten Behling <carsten.behling@gmail.com>
Date: Tue, 14 Apr 2026 14:30:19 +0200
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
	pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
Message-ID: <m3uuy5f4txsfi4wbocasaqpf64w23cxwobv37thxnp4nzmz4vj@xahbt6bbnudq>
References: <7asofwgi5xn2yux4nau7xvjibfokdzipxsmmjfkixs33ceguaj@22xbaftccepg>
 <80900a76-f35e-4959-a178-f66b718ab9cc@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80900a76-f35e-4959-a178-f66b718ab9cc@intel.com>

Hi Cezary,

thank you so far. AVS configuration is still a challange, so may
be you can help with some details.

On Wed, Mar 11, 2026 at 01:53:49PM +0100, Cezary Rojewski wrote:
> 
> The -19 error code states: -ENODEV, codec#2 is hardwired to HDMI. Summary:
> probe of HDAudio (HDA) HDMI device failed. Some APL-based in the field are
> devoid of HDMI and, if I recall correctly, the TASxxxx device is not a HDA
> codec, it's an I2C device where streaming occurs over I2S. Smells like
> invalid Audio settings in BIOS.
> 
> My comment regarding the topology highlights the fact that one can overwrite
> either the entire NHLT or part of it with ACPI tools -or- the avs-topology.
> The error seen here _does not_ relate to NHLT (or the topology) at all.
> Streaming over HDA does not involve reading NHLT either, your BIOS may have
> no NHLT or an empty one and streaming over HDA should work just fine.
> 
> Are you sure your device is equipped with HDMI? Seeing the entire dmesg
> would be helpful here - could you open some kind of bugzilla or, an issue on
> avs-topology-xml project mentioned by me earlier?

Sorry, this error message is irrelevant. My fault. TAS5722 is a simple
I2S/I2C mono audio amp. Now I set up a current kernel BSP with that issue.

Regarding my initialization ambguities:

1. At platform driver probe I observed that calling snd_intel_dsp_driver_probe(...) bails
   out returning SND_INTEL_DSP_DRIVER_LEGACY here:
   ...
   static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
   {
   ...
	ret = snd_intel_dsp_driver_probe(pci);
	switch (ret) {
	case SND_INTEL_DSP_DRIVER_ANY:
	case SND_INTEL_DSP_DRIVER_SST:
	case SND_INTEL_DSP_DRIVER_AVS:
		break;
	default:
		return -ENODEV;
  ...

  with:

  int snd_intel_dsp_driver_probe(struct pci_dev *pci)
  {
  ...
	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
	if (!cfg)
		return IS_ENABLED(CONFIG_SND_HDA_INTEL) ? // <-------- CONFIG_SND_HDA_INTEL=n
			SND_INTEL_DSP_DRIVER_LEGACY : SND_INTEL_DSP_DRIVER_ANY;
  ...

  so I set

  CONFIG_SND_HDA_INTEL=n

  assuming this may not be needed for my I2C ?NonHD? case. The other option seems to be extending
  the config_table and returning SND_INTEL_DSP_DRIVER_AVS. But this additional code twaek seems
  odd to me. But if CONFIG_SND_HDA_INTEL is needed additionally (for HDMI?) what is the way to go?

2. Later in probe snd_hdac_i915_init(...) call has to pass at sometime to not defer time out:
   ...
   
	ret = snd_hdac_i915_init(bus);
	if (ret == -EPROBE_DEFER)
		goto err_i915_init;
	else if (ret < 0)
		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
   ...

   This only succeeds when

   CONFIG_DRM_I915 = y

   that sets the mandatory acomp->ops:


3. With the above kernel config the i2c board registration triggers but checking for a valid
   enpoint fails here:


  static int avs_register_i2s_boards(struct avs_dev *adev)
  {
  ...
	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP, -1, -1, -1)) { <---- No way to pass without an endpoint in NHLT ACPI table
		dev_dbg(adev->dev, "no I2S endpoints present\n");
		return 0;
	}
  ...

  since our BIOS is made for a SOC module that didn't know about our external TAS5722 and has no NHLT enpoint in turn:

  Thread 29 hit Breakpoint 5, acpi_nhlt_find_endpoint (link_type=link_type@entry=3, dev_type=dev_type@entry=-1, dir=dir@entry=-1, bus_id=bus_id@entry=-1)
    at /usr/src/kernel/drivers/acpi/nhlt.c:127
  127	{
  (gdb) n
  129		return acpi_nhlt_tb_find_endpoint(acpi_gbl_nhlt, link_type, dev_type, dir, bus_id);
  (gdb) p acpi_gbl_nhlt
  $25 = (struct acpi_table_nhlt *) 0xffffc9000001af80
  (gdb) p *acpi_gbl_nhlt
  $26 = {header = {signature = "NHLT", length = 45, revision = 0 '\000', checksum = 169 '\251', oem_id = "INTEL ", oem_table_id = "EDK2    ", oem_revision = 2, 
      asl_compiler_id = "    ", asl_compiler_revision = 16777235}, endpoints_count = 0 '\000'}
  (gdb) n
  avs_register_i2s_boards (adev=adev@entry=0xffff888074d03828) at /usr/src/kernel/sound/soc/intel/avs/board_selection.c:570
  570			dev_dbg(adev->dev, "no I2S endpoints present\n"); <------ OUT

  ...

  It looks like that this blob is later used in the avs driver. In our old 4.19 kernel with the 'skylake' driver we needed
  to patch a so called 'blob' (not sure if I am allowed to post that hex data here) that was an array of bytes inserted/tweaked
  into the ACPI NHLT config section.
  
  So how can I overwrite the entire NHLT part with the avs-topology so that the enpoint queries in board_selection.c and path.c are passed with no endpoints
  from BIOS?

  Which information is needed instead of the binary blob and how can I add it to my tas5720-tplg.xml?

  Best regards
  Carsten
