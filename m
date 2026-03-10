Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415683B776E
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147843; cv=none; b=gklBiHZCK/aNrCmaioFfnY692NnGsJEoKbRzJKqSXLZkpp2uY13H6fP/84USZo1tyU+HsBxv/OyaiBq92SBAY68ZTsXcySpmaq/rPG4cozhlF71Ea4/hP/SlBQPBqiuxFt82x4/9rbcJTP2VMz7PkxaMC5I1vfjiqe106iuNp5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147843; c=relaxed/simple;
	bh=UhgBRq7MVWEnvZm7ZobrpnfIrMokyxIEOuwO5sGUB8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnUMAotsp8sLoWynm9JuTWmUyIOkxN2ol1+WvsF98hNsq7mD5aQJZ8+iDhdEXApqNAd4L7jaEQfHkAs8JDdTLD9UOrdDRkTtFrxBRVEgqY3pEl8EHRRqqHljAvhv2lz4WZdw7okKBE4tEhyx4nkK0/g0zoHAYUAN5iiRlEKhRkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbUWmFO/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbUWmFO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773147841; x=1804683841;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UhgBRq7MVWEnvZm7ZobrpnfIrMokyxIEOuwO5sGUB8M=;
  b=PbUWmFO/2fz5Z+l7eVeIU/dX+MHnbp+Mb7YB1+otLdOcXnBxhuKJFKHZ
   RMydg37xqIaLK5I6XAJm1PBqoUsilojoiYl39yzZPLv4sNG321I719t1N
   UbRVuhJczZA2AIG0MZGHl3VR7+Nqg3Az1nyfehg5mIgbU2G8mxCzMOF6L
   a/6jhCXjCADa71vfuA0Oaz36GgYwsfkUEsD7xsMfahkDIejGRln7y7JkX
   oUlHffIYyFb1CeAUTT3F5DkMZl0K0vjQn5Owdbk1t+bu7nakqp9PHtMDT
   s+6iJpyRXv74s3tX93dln/CoT6gq4rkeEt99iCl4XCzSQw6gZn4Rp7cTU
   g==;
X-CSE-ConnectionGUID: hXKIrd7nTgOrSjVuCAjwiQ==
X-CSE-MsgGUID: xGPwVSvETKeSrhq9/jOCDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74308727"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74308727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:04:01 -0700
X-CSE-ConnectionGUID: 14D/Ap1jRZGXaxQVzTECbA==
X-CSE-MsgGUID: 5Ndt0OBWS8i68hQ9kz7L+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="219237162"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.5]) ([10.245.244.5])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:03:58 -0700
Message-ID: <2ddf597c-63a0-43b2-a31a-3ec692016c4a@linux.intel.com>
Date: Tue, 10 Mar 2026 15:04:10 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
 support Apollo Lake/TAS5722
To: Carsten Behling <Carsten.Behling@loewensteinmedical.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Cc: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>
References: <7f3fde61-5319-4001-8b7e-ed44008a1521.152c0446-3a39-4bcf-a504-672812e167ea.c8587f20-63e8-402e-be65-78b29d37359b@emailsignatures365.codetwo.com>
 <AM0PR01MB1244966F3CBED7538B41DA7AB9046A@AM0PR01MB12449.eurprd01.prod.exchangelabs.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <AM0PR01MB1244966F3CBED7538B41DA7AB9046A@AM0PR01MB12449.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/03/2026 11:39, Carsten Behling wrote:
> Hi,
> 
> while moving to a recent kernel version, I need to port the E3930 (cAVS
> 1.5) <-> TA5722 sound soc support from 'Skylake-Driver' to AVS.
> 
> I assume these facts:
> 
>  1.
>     The port covers basically four components:
>      1.
>         the board file aka ALSA Machine Class Driver
>      2.
>         the DSP firmware
>      3.
>         the Topology File
>      4.
>         the NHLT ACPI Table
>  2.
>      After some confusion it looks like the AVS driver is the way to go
>     and SOF is dropped after old 'Skylake-Driver' was dropped.

I'm not sure what you mean, but APL is supported by SOF stack with IPC3
and sof-firmware package have the needed firmware and some topologies
for the platform.
I'm using SOF on up2 board with HifiBerry hat on (PCM512x).

>  3.
>     The DSP file is signed by intel and obtained by the linux-firmware
>     project.
>  4.
>     The topology file can be written in XML as done in avs-topology-xml
>     I2S subfolder and is then compiled with the AVSDK's avstplg tool
>     into 'Use Case-File' and than with alsa-utils alsatplg tool into bin
>     format.
>  5.
>     The board file can be added in sound/soc/avs/boards.
>  6.
>     The NHLT ACPI table is a little opaque to me.  Due to missing
>     enpoints in the NHLT table, my predecessor extracted a
>     byte array from a *.blob file and tweaked it into a struct
>     nhlt_specific_cfg and hended it over to the old Skylake driver.
>     I have no cue where this *blob file comes from and what the
>     extracted contents means exactly. 
>     The ACPI specification is a little confusing on this. It seems to be
>     the Format Configuration for the DSP.  I think the old
>     Intel way was to pass the *.blob file to the kernel. I found that
>     iasl compiler is capable to generate a template NHLT *.asl file that
>     could be filled with the matching enpoint data and compiled back to
>     *.aml .
>     To me it's not clear where to but that array from NHLT blob above.
>     Furthermore, I don't now how to load it by the kernel.
>     I thought about some kind of overloading similar to
>     CONFIG_ACPI_CUSTOM_DSDT_FILE, lets say CONFIG_ACPI_CUSTOM_NHLT_FILE
>     feature.
> 
> 
> In a first step I took a look on how everything works together by
> tweaking the original NHLT blob into AVS driver to prevent the board
> selection from failing loading the board driver.
> I made a quit similar copy of topology file max98357a-tplg.xml and the
> sound/soc/intel/avs/boards/max98357a.c board file.
> 
> Along with the newest dsp_fw_apl_release.bin DSP firmware the sound card
> comes up, the DSP starts without error and the topology file is loaded
> without errors.
> 
> While the Codec registers are set correctly while playing no I2S frames
> are output by the DSP.
> 
> My questions:
> 
>  1.
>     Is this the correct way?
>  2.
>     Since the board supplier suggests SOF driver support giving a
>     Elkhartlake/SGTL5000 reference only, the community
>     seems to be the only way to get support. I started implementation on
>     for-next audio soc branch and I'm ready to contribute with the help
>     of the maintainers.

If the board supplier have up to date machine driver and topology for
EHL (there seams to be none upstream for TAS5722) then with the sources
it should be just rebuilding the topology for APL - and include the NHLT
into it.

But since you already made good progress with AVS, probably that is the
path with least resistance.

>  3.
>     Can I expect help?
>  4.
>     Can I provide my patches here to discuss though I haven't audio output?
>  5.
>     Since the topology file is part of avs-topology-xml, should I start
>     a second thread there in parallel?
> 
> 
> Best regards
> Carsten
> 
> *Carsten Behling*
> Embedded Software Developer
> 
> T. +49 40 54702517
> Carsten.Behling@loewensteinmedical.com
> <mailto:Carsten.Behling@loewensteinmedical.com>
> 
> Löwenstein Medical Technology GmbH + Co. KG 
> Kronsaalsweg 40
> 22525 Hamburg Deutschland 
> loewensteinmedical.com <https://loewensteinmedical.com/> 
> 
> Geschäftsführung: Benjamin Löwenstein, Sascha Löwenstein ∙
> Registergericht: Amtsgericht Hamburg, Abt. A, Nr. 67 698, USt-IdNr. DE
> 118051598, WEEE-Reg.Nr. DE 63391140 ∙ Komplementärin: Löwenstein Medical
> Technology Verwaltungs GmbH, Hamburg ∙ Registergericht Amtsgericht
> Hamburg, Abt. B, Nr. 8678
> 
> <https://www.youtube.com/c/löwensteinmedicaldeutschland><http://
> www.facebook.com/loewensteinmedical/><http://www.linkedin.com/company/
> loewensteinmedical> 
> 
> <https://loewensteinmedical.com/de-de/neonatologie/leoni-4/?
> mtm_campaign=leoni41125de&mtm_source=mail&mtm_medium=signatur_banner>
> 

-- 
Péter

