Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62E47DF95
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867616; cv=none; b=rtqx4Ww9+Lw5WRqfpsJccCm/MYWdnjdopY4xDTifi2IicQD3c/prX09BffVSaapuHtAYmgSXE3RCXS4aauFfX+2+yARBUvpsFApENQFP41J3EkepD4tkW3MCCPX+CnQ3+LQeJuNEfeHjgKH2aaZY33IPVN5fcSSIPDaXSvWmjx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867616; c=relaxed/simple;
	bh=2VD19bgJI0x1UihI0HQnWOMNn1lZUKuSVwf2lYt80Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Guuj0d1l2II4myqPBOK+TW+NRefeYhHYQicQltdSZ4/OjGDpxD1mUkosYRM/KXb6o/0mXgYgbMAC6nKlS4tVh5wNzlP9q6MbbA9dCHdmPX/g/RtRDuA78hROOm7U8UC94TY3xIyQfAQEZ4y8XXhLNMsVWyQNRooEhpnTMBxtwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SOuU5chI; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SOuU5chI"
Message-ID: <d748ba7c-165d-420a-bd33-a860acf2f01d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767867610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWP8qNiTUYkgDHDv2lHzz407A0e6GIIDf4QiSGW83mk=;
	b=SOuU5chIxERZv0IG+kefqFLuMnTPZFyNcZQ26ld9sOig12FzmlhV0YbBA2t8ndCNMFl8+C
	WxBZnUd7Wx70MFDN7dw1UenXFJfaAEEiugAyyn+95yGfOGDUxkacIEoho/P8vfjVZIlzcV
	5cTTL2pKK/49x70BcBiI8XFgWpG54qw=
Date: Thu, 8 Jan 2026 11:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] Samsung Galaxy Book 4 Ultra - MAX98390 speakers not
 supported on MTL platform
To: =?UTF-8?Q?Jos=C3=A9_Augusto_de_Almeida_Neto?= <jaalneto@hotmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 1/7/26 23:26, José Augusto de Almeida Neto wrote:
> Hi ALSA developers,
> 
> I'm reporting a hardware support issue with the Samsung Galaxy Book 4 Ultra
> (NP960XGL-XG1BR) running on Intel Meteor Lake (MTL) platform.
> 
> SUMMARY:
> The laptop has MAX98390 smart speaker amplifiers that are not supported in
> the current Linux kernel. Headphones work (ALC298 HDA codec) but speakers
> are completely non-functional.
> 
> HARDWARE:
> - System: Samsung Galaxy Book 4 Ultra (NP960XGL-XG1BR)
> - CPU: Intel Meteor Lake-P
> - Audio Controller: Intel MTL HD Audio (8086:7728)
> - HDA Codec: Realtek ALC298 (working for headphones)
> - Speaker Amps: 4x Maxim MAX98390 on I2C bus 2 (addresses 0x38, 0x39, 0x3C, 0x3D)
> - Kernel: 6.17.9 (also tested on 6.8.0 mainline)
> 
> ROOT CAUSE:
> 1. No machine driver match in soc-acpi-intel-mtl-match.c for Samsung + MAX98390
> 2. No SOF topology file for MTL + HDA + MAX98390 combination
> 3. NHLT only shows SSP2 (Bluetooth), no SSP configured for speakers
> 4. SOF falls back to generic skl_hda_dsp_generic (2-channel HDA only)
> 
> VERIFICATION:
> - MAX98390 chips respond on I2C (revision 0x42 confirmed on all 4 chips)
> - ACPI device MAX98390:00 present (status 15 - enabled)
> - ALC298 speaker DAC receives audio but no output from physical speakers
> - No I2S/TDM connection to MAX98390 amplifiers
> 
> I have collected detailed technical information including:
> - DSDT and NHLT ACPI tables
> - Full HDA codec dump
> - I2C bus scans and MAX98390 register reads
> - dmesg logs showing current SOF behavior
> 
> Full detailed report: BUG_REPORT.md attached
> 
> QUESTION:
> Is there ongoing work to support MAX98390 on Meteor Lake platforms?

This has nothing to do with SOF, the main issue is that the amplifier needs to be configured by HDAudio verbs which are translated by the HDaudio codec in I2C commands. The problem is to reverse-engineer what those verbs might be, usually with a Windows setup. There was a Wiki for this sort of things, see https://thesofproject.github.io/latest/getting_started/intel_debug/suggestions.html#reverse-engineer-the-windows-audio-driver

