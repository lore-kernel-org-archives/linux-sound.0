Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274F38B9A6
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858847; cv=none; b=n5W7MoO3rBOjuxl2UvhV/f4Agz/jZFQbFpQKWcqx/eQ/sdom8CgxmLZ7cn8vnl2f+IMmBlO3MZhS9DaqfoNmyMfrXnMPIrNPoFHgqavB9q8rUoYl8R82UKIe8THbxYFJZEc6AgeaL+vZe2AgSDBWGJ7wBkucfm0VcqjrTIJY3VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858847; c=relaxed/simple;
	bh=Oat8Ou69Boc/QWkzBIaS0AdsCze4tkLUTDL+HxfGJK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hn9M+XgYcFoep8GNwuEQUtjtIz30P3ZbnmXxrIXTxl5gbCNjzHCNBqcawhwzBYI5M4QQRSbCsKj7H7aa6myo0ERx5M3HWSdmj79KZU0Lw2CGe5yNr6S4AHQEpg14h44TZFvnalBT5TMXEL4Nou5vYibbiqllnKcu2wTrtiAy9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vut6KfTb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vut6KfTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767858842; x=1799394842;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oat8Ou69Boc/QWkzBIaS0AdsCze4tkLUTDL+HxfGJK0=;
  b=Vut6KfTbIDP7ttNyWHRzNDotJVg1oRMYZOk4Ii5VkF9YJjrEFF8DY785
   6wfUjkX/trXJ7S+eWU06jjTrZ+tjn1VEXHxrvto9/osTH65w3OiVuODbs
   pIL1dXIQXuXe2vtEr5LQiAO55MVait8LdOBvM5Zh9muSzrkAaCtUuUwWe
   d67nsy80NjhkALFf80t6yZaMg6ph8tixwUBeOW7AyJT5z7RKue2qQf/uZ
   bom8m+EwmIE/13AL+qoXDg+1AdlKEnfLn9zZbfQzKvcwooqk51g0EDtUF
   VV6nKilBl7FoijSzTSwapYuZmLSPVLFsqqTiUbo/yYkyNoQpghucPVYrL
   Q==;
X-CSE-ConnectionGUID: 6EV37zJ1R+WWbOoYbn65vw==
X-CSE-MsgGUID: G+dD01MyQd+WeItjx8EGBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69145176"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="69145176"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 23:53:58 -0800
X-CSE-ConnectionGUID: BLtfOUCgQEKaL5ANX05Clw==
X-CSE-MsgGUID: w9c9+4rnQrS2SNMkEYMgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="207273581"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.246.92]) ([10.245.246.92])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 23:53:57 -0800
Message-ID: <0a0234c5-b6c6-4318-b627-d75e75a7598c@linux.intel.com>
Date: Thu, 8 Jan 2026 09:53:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Samsung Galaxy Book 4 Ultra - MAX98390 speakers not
 supported on MTL platform
To: =?UTF-8?Q?Jos=C3=A9_Augusto_de_Almeida_Neto?= <jaalneto@hotmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <PH3PPF0A8D5CDB5873FA91A7F768F4E2F10D984A@PH3PPF0A8D5CDB5.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi José,

The machine likely similar to Book 4 Pro, it is an HDA+companion amp setup:
https://github.com/thesofproject/linux/issues/5002

The bounty for Book 4 Pro resulted (as far as I know) working audio,
which can be replicated:
https://github.com/stephanlensky/galaxy-book4-linux-sound

You might need to add the quirk for the Ultra and by luck it might work
as well.

SOF is not needed, used in these machines as they are pure HDA devices.

-- 
Péter

On 08/01/2026 00:26, José Augusto de Almeida Neto wrote:
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
> - Speaker Amps: 4x Maxim MAX98390 on I2C bus 2 (addresses 0x38, 0x39,
> 0x3C, 0x3D)
> - Kernel: 6.17.9 (also tested on 6.8.0 mainline)
> 
> ROOT CAUSE:
> 1. No machine driver match in soc-acpi-intel-mtl-match.c for Samsung +
> MAX98390
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
> I'm willing to test patches and provide additional debugging information.
> 
> Thank you,
> Jose
> 


