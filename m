Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B13CF030
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776262957; cv=none; b=H5bcPQsxMQf5qapkfaXHjJpvwTI4ICxNTkQjT/lfaOuO+5dEYalBglzDDNwo0RbM/upc5xIoihKxaxbRoe9BIPyNYLptjLLBv47uEyRqrX8uHPNN0VXnepSUntHG24T9MRl13oP76y8Sw5mHEbtxmfv/rRrDqVBlDToSI2e66rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776262957; c=relaxed/simple;
	bh=Qjorlef84tyR+lU19LGfPKia/eHEYwCpzS4cNFC24JU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WU8LosCgLmpX+tj+gII1t/De8lLJEbKvDi6rMkk1iZ+IyksHUOH9pQGMD1ks1QVUvMTsgb1p/DikDriypy7H2IKvCQaFbqqttEBytr/stSeQhCiyV9fgd6NUu2CIRBu3ynU6u7dfLuGioaujLdJPM2+zqPMkfL2aF6xik9SFk5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=LXfYdHMK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LXfYdHMK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488c2690057so69374935e9.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1776262954; x=1776867754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHu1VQHoe9E14WwcvyVP+yyZm1WY1ZOFl45zJggQGyo=;
        b=LXfYdHMK1VoZt+ixFwOiOgPKO/L8BpZxkXfpeaG5Y5bFGxlwvkybiCrZpOm1xu9QQJ
         YApI6bbOO7frHlauK/fdmvY+tEFw/kgZOTIXeNYQIYUi1zYVv3wWGvd/hDiFo0645C9e
         RcfuJ7XT78FyxA6C9JGvj5z+DVzL7PCzfeWIUC0jtjtnHMK4zMGJCG/hOdOmKJuzPkK1
         N4QLmGe08JivC2LXLmIWMTvOLmr3mo1et35K1/FEtuvUbtV+oPScWd+IyucpzovEjf+2
         y/ecXHg/RcwSR5KKld/OLIyJEB+PEgUhFl/XhAty9oFuzBuOCvHYerq7B4sjHunqgT/1
         HP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776262954; x=1776867754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHu1VQHoe9E14WwcvyVP+yyZm1WY1ZOFl45zJggQGyo=;
        b=plcwJXo3R6kdH6X+CZsSWs8DfG0wcQlgstJk22c49JQJPkpzV4Gh6BgY1ovI60Cyh2
         Fqh2js366niM6fKyr9yRPHPZkv2nDob2O/lrD+37E2fJYrrptL349EPhdP3tfWavzMQz
         HBkr+RMHpzLfosX17qW9CloWH6gqW1ov/Ru1yfFVQ1e/tikXgzkECkjvDyT0e5Y/m7YK
         UgpJr0GKVMZhLcgLLEcVMj15zAbXKSS+j48th9y+ceON7DGnYk3LsZAu+VA/L/7whq+o
         kTGFqXVR6uFPqR/8YkqVR26cdL43D1ml7iLVsveckkd9n944Ly2WBoOlzHZ5Eqbe3BV4
         g6pA==
X-Forwarded-Encrypted: i=1; AFNElJ+vqDmHMg+35oStvT65lnNcX0s/2xmEYFga+EzxneP9IbzhOjxfxjiaJ1FyDaVCcTPYVRHj5Oe7OFz4zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZAiCCHlWuK8zLzGPAk/RGzIahxMXDkFTd0ylH4pME4JzBq/ck
	J5dW6XV/5LxVJAHBmvFzFRu1xhZsDyjy2iPEAGAwdSL0uVWclLQkqzvm
X-Gm-Gg: AeBDiesuoTDtk6Uva/7KzOrLb7fDvGJSNWlPSN+q9RglNkZ/YI6AgxTY/ve+CvWI9WW
	xZQ0uDrfzmgfmt6eIZisfdsdmkrr6nEd+9zmIEv5aQzc3szZXmr82+9KODQi4EmlsGdplQVOsYh
	n8fQI4B6KAi9NWoxdO6Sus65s8zB5oC7asdE6kzmXY4johtHA7VXLX6h6vM5S84um5iNbtuy+0M
	N05Ugwa3PNdB5pXFYTLctHg035ikLreszOxsc7/b/cwMCE6J5FcjVEoRlSVLbLExkLu0rtj0l+a
	+DjlxBhIJqeAHSWqaif6nNi+UUPElRN6rV0LzNN8NzpZsUhyEMpm7A/BUXJ0L5l+/lah+4tnazv
	AX5KSHtKj5qMK34jivF9qQV5OPyVCsQSSwVSQPkv7nPDeZPZqJ+6T1kFToFdy+Q8fUneWenBJKX
	Dx5rGdY7TX5KbCsv77vtb39oi94qBN3OfRFLPtTr0W6Pc9YC7gypkrmXYt9g==
X-Received: by 2002:a05:600c:c0cc:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-488d68af13dmr201136765e9.17.1776262954216;
        Wed, 15 Apr 2026 07:22:34 -0700 (PDT)
Received: from cabe-ThinkPad-P16-Gen-2 ([2a01:599:c08:3186:545a:39b:1449:6a94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f095e68dsm37359175e9.2.2026.04.15.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:22:33 -0700 (PDT)
From: Carsten Behling <carsten.behling@googlemail.com>
X-Google-Original-From: Carsten Behling <carsten.behling@gmail.com>
Date: Wed, 15 Apr 2026 16:22:31 +0200
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Carsten Behling <carsten.behling@googlemail.com>, 
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
	linux-sound@vger.kernel.org
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
Message-ID: <77ijfqkoum7uojrjn3h2ystnucxj2yvfjnnbz4yfdjdvgwq26d@76talataqnov>
References: <7asofwgi5xn2yux4nau7xvjibfokdzipxsmmjfkixs33ceguaj@22xbaftccepg>
 <80900a76-f35e-4959-a178-f66b718ab9cc@intel.com>
 <m3uuy5f4txsfi4wbocasaqpf64w23cxwobv37thxnp4nzmz4vj@xahbt6bbnudq>
 <8206ed79-823a-437a-9171-ec8f24291dd1@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8206ed79-823a-437a-9171-ec8f24291dd1@intel.com>

On Wed, Apr 15, 2026 at 11:44:40AM +0200, Cezary Rojewski wrote:
> Instead of modifying kconfigs, select the desired driver. For avs:
> 
> 	vi /etc/modprobe.d/<any .conf file>
> 	options snd_intel_dspcfg dsp_driver=4
OK, I was not aware of that:
sound/hda/core/intel-dsp-config.c:MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");

> 
> All HDAudio related drivers co-exist with each other. You could have all of
> them enabled at once and your selection should still be respected.
> 
> SND_HDA_INTEL enables non-DSP HDAudio driver
> SND_SOC_INTEL_AVS enables DSP-capable HDAudio driver
> 
> both utilize the exact same HDAudio library - code sharing.
Thanks for clarifying.
 
> > 
> > 2. Later in probe snd_hdac_i915_init(...) call has to pass at sometime to not defer time out:
> >     ...
> > 	ret = snd_hdac_i915_init(bus);
> > 	if (ret == -EPROBE_DEFER)
> > 		goto err_i915_init;
> > 	else if (ret < 0)
> > 		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
> >     ...
> > 
> >     This only succeeds when
> > 
> >     CONFIG_DRM_I915 = y
> > 
> >     that sets the mandatory acomp->ops:
> 
> If there is no i915 on your device you can blacklist it. See
> i915_gfx_present() in sound/hda/core/i915.c
Thanks for clarifying.

> 
> > 3. With the above kernel config the i2c board registration triggers but checking for a valid
> >     enpoint fails here:
> > 
> > 
> >    static int avs_register_i2s_boards(struct avs_dev *adev)
> >    {
> >    ...
> > 	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP, -1, -1, -1)) { <---- No way to pass without an endpoint in NHLT ACPI table
> > 		dev_dbg(adev->dev, "no I2S endpoints present\n");
> > 		return 0;
> > 	}
> >    ...
> > 
> >    since our BIOS is made for a SOC module that didn't know about our external TAS5722 and has no NHLT enpoint in turn:
> > 
> >    Thread 29 hit Breakpoint 5, acpi_nhlt_find_endpoint (link_type=link_type@entry=3, dev_type=dev_type@entry=-1, dir=dir@entry=-1, bus_id=bus_id@entry=-1)
> >      at /usr/src/kernel/drivers/acpi/nhlt.c:127
> >    127	{
> >    (gdb) n
> >    129		return acpi_nhlt_tb_find_endpoint(acpi_gbl_nhlt, link_type, dev_type, dir, bus_id);
> >    (gdb) p acpi_gbl_nhlt
> >    $25 = (struct acpi_table_nhlt *) 0xffffc9000001af80
> >    (gdb) p *acpi_gbl_nhlt
> >    $26 = {header = {signature = "NHLT", length = 45, revision = 0 '\000', checksum = 169 '\251', oem_id = "INTEL ", oem_table_id = "EDK2    ", oem_revision = 2,
 > >        asl_compiler_id = "    ", asl_compiler_revision = 16777235}, endpoints_count = 0 '\000'}
> >    (gdb) n
> >    avs_register_i2s_boards (adev=adev@entry=0xffff888074d03828) at /usr/src/kernel/sound/soc/intel/avs/board_selection.c:570
> >    570			dev_dbg(adev->dev, "no I2S endpoints present\n"); <------ OUT
> > 
> >    ...
> > 
> >    It looks like that this blob is later used in the avs driver. In our old 4.19 kernel with the 'skylake' driver we needed
> >    to patch a so called 'blob' (not sure if I am allowed to post that hex data here) that was an array of bytes inserted/tweaked
> >    into the ACPI NHLT config section.
> 
> For the readers.  IIRC the above describes a hack, patching NHLT with "blob"
> files available in sysfs/debugfs was never officially supported. The dev
> team flushed that code later in favour of SSDT overlays and later
> NHLT-config [1].  The former expands on Intel's topology rather than playing
> with fs.
Yes, our tweak was (sound/soc/intel/skylake/skl-topology.c):
...
/*
 * Fill the BE gateway parameters
 * The BE gateway expects a blob of parameters which are kept in the ACPI
 * NHLT blob, so query the blob for interface type (i2s/pdm) and instance.
 * The port can have multiple settings so pick based on the PCM
 * parameters
 */
static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
				struct skl_module_cfg *mconfig,
				struct skl_pipe_params *params)
{
	struct nhlt_specific_cfg *cfg;
//	struct skl *skl = get_skl_ctx(dai->dev);
	int link_type = skl_tplg_be_link_type(mconfig->dev_type);
//	u8 dev_type = skl_tplg_be_dev_type(mconfig->dev_type);

	/* NHLT blob:
	   cat MR4/audio/audio_mr4_beta_firmware/Blob/Dummy/
	       2ch_48k_32b_in_32b_i2s1mclk_socmaster_cb29e669eb175c92.blob
		| hexdump -v -e '/1 "0x%02x, "'
	*/
	static u8 LmtNhltBlob[] =
		{ 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		  0x10, 0xff, 0xff, 0xff, 0x10, 0xff, 0xff, 0xff,
		  0x10, 0xff, 0xff, 0xff, 0x10, 0xff, 0xff, 0xff,
		  0x10, 0xff, 0xff, 0xff, 0x10, 0xff, 0xff, 0xff,
		  0x10, 0xff, 0xff, 0xff, 0x10, 0xff, 0xff, 0xff,
		  0x7f, 0x07, 0xf0, 0xc1, 0x00, 0x00, 0x70, 0xc0,
		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x02,
		  0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,
		  0x02, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		  0x00, 0x0f, 0x07, 0x07, 0x20, 0x00, 0x00, 0x00,
		  0x01, 0x00, 0x11, 0x00, 0xff, 0x0f, 0x00, 0x00,
		  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
		  0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
		  0x00, 0x00, 0x00, 0x00
		};


	skl_tplg_fill_dma_id(mconfig, params);

	if (link_type == NHLT_LINK_HDA)
		return 0;

	/* update the blob based on virtual bus_id*/
/*
	cfg = skl_get_ep_blob(skl, mconfig->vbus_id, link_type,
					params->s_fmt, params->ch,
					params->s_freq, params->stream,
					dev_type);
*/
	cfg = (struct nhlt_specific_cfg *)LmtNhltBlob;

	if (cfg) {
		mconfig->formats_config.caps_size = cfg->size;
		mconfig->formats_config.caps = (u32 *) &cfg->caps;
	} else {
		dev_err(dai->dev, "Blob NULL for id %x type %d dirn %d\n",
					mconfig->vbus_id, link_type,
					params->stream);
		dev_err(dai->dev, "PCM: ch %d, freq %d, fmt %d\n",
				 params->ch, params->s_freq, params->s_fmt);
		return -EINVAL;
	}

	return 0;
}
...
 
> >    So how can I overwrite the entire NHLT part with the avs-topology so that the enpoint queries in board_selection.c and path.c are passed with no endpoints
> >    from BIOS?
> > 
> >    Which information is needed instead of the binary blob and how can I add it to my tas5720-tplg.xml?
> 
> Looks like a typical broken/lackluster BIOS case.  Related documentation can
> be found under "SSDT Overlays" [2].  Scripts can be found at acpi-scripts
I wasn't aware that NHLT can be overwritten with SSDT overlay. Aren't
they different tables or am I wrong?

> [3].  NHLT can be built using nhltdecode [4].
Will check and build into my yocto as I did with avstplg to convert
my tas5720-tplg.xml. No README found. Looks like it needs another XML input file (Program.cs):
...
namespace nhltdecode
{
    class Program
    {
        static void Main(string[] args)
        {
            var rootCmd = new RootCommand();

            var compileOption = new Option<FileInfo>("--compile", "compile XML file") { ArgumentHelpName = "file" };
...

I found that basically a NHLT blob could be created this way:

...
iasl -T nhlt # generates nhlt.asl template file including an example I2C enpoint configuration example
(modify until having the I2S codec on SSP3 and the ???format/gateway??? config)
iasl nhlt.asl # creates nhlt.aml binary output
...
I currently use
CONFIG_ACPI_CUSTOM_DSDT_FILE="dsdt.hex"
for tweaking in the TAS5277 codec (see: https://wiki.debian.org/OverridingDSDT).
I did not found anything for NHLT in the kernel.

How will the compiled NHLT binary output passed to the kernel?
IIUC SSDT Overlay does the trick here for NHLT also. Right?

> If you provide me with the
> details of your configuration i.e.: what has been used with skylake-driver,
> I can prepare one for you.  Obviously the list is not a place for that.
I would greatly appreciate that. See 'LmtNhltBlob' above. I'm currently investigating
if that blob contains the gateway config the format config or both.

This may solve this issue:

...
root@p5:~# aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
default:CARD=TAS5720
    AVS I2S TAS5720, 
    Default Audio Device
sysdefault:CARD=TAS5720
    AVS I2S TAS5720, 
    Default Audio Device
root@p5:~# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: TAS5720 [AVS I2S TAS5720], device 0: Built-in Speakers (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
root@p5:~# aplay /usr/share/sounds/alsa/Front_Center.wav 
snd_soc_avs 0000:00:0e.0: Endpoint format configuration not found.
Playing WAVE '/usr/share/sounds/alsa/Front_Center.wav' : snd_soc_avs 0000:00:0e.0: Endpoint format configuration not found.
Signed 16 bit Little Endian, Rate 48000 Hz, Mono
snd_soc_avs 0000:00:0e.0: module-type create failed: -2
snd_soc_avs 0000:00:0e.0: error creating module -2
snd_soc_avs 0000:00:0e.0: create path failed: -2
snd_soc_avs 0000:00:0e.0: ASoC error (-2): at snd_soc_dai_hw_params() on SSP3 Pin
 SSP3-Codec: ASoC error (-2): at __soc_pcm_hw_params() on SSP3-Codec
 Built-in Speakers: ASoC error (-2): at dpcm_fe_dai_hw_params() on Built-in Speakers
aplay: set_params:1462: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 16
CHANNELS: 1
RATE: 48000
PERIOD_TIME: 125000
PERIOD_SIZE: 6000
PERIOD_BYTES: 12000
PERIODS: 4
BUFFER_TIME: 500000
BUFFER_SIZE: 24000
BUFFER_BYTES: 48000
TICK_TIME: 0
...

(I currently ignore the ep point check to learn what's missing):
...
static int avs_register_i2s_boards(struct avs_dev *adev)
{
	int num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
	struct snd_soc_acpi_mach *machs;
	struct snd_soc_acpi_mach *mach;
	int ret;

	//if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP, -1, -1, -1)) {
	//	dev_dbg(adev->dev, "no I2S endpoints present\n");
	//	return 0;
	//}
...
> 
> 
> [1]: https://lore.kernel.org/linux-sound/20251115180627.3589520-1-cezary.rojewski@intel.com/
> [2]:
> https://www.kernel.org/doc/html/latest/admin-guide/acpi/ssdt-overlays.html
> [3]: https://github.com/thesofproject/acpi-scripts?tab=readme-ov-file#adding-acpi-table-upgrades
> [4]: https://github.com/thesofproject/avsdk/tree/main/nhltdecode
> 
> 
> Kind regards,
> Czarek
Best regards
Carsten
