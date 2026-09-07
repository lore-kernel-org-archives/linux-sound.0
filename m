Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498BB377A93
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 05:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758100; cv=none; b=H2KhujTD420I3CNLxghRNuhbxyRDxcj/9J2wJbwvoAyletsBrbynMDchAjf7IXE0C4WGxlUKI1uP/YdBBWR/WaCQjpVJqhJfXT2f4H5Ig9SO2TKAlmWnNxX3pP7KiTClJ2R5yWb88hbxl+6x7lnZM2kQOXLQHLNe7QXQxywLuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758100; c=relaxed/simple;
	bh=q1JysKbMQrgBIrVbdgxw4Xm8SLloSRii2kC4G8MCMA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhpdJXdLJF+9/u9RWuAnI42F5hg0iP+lsivAYkjN0+WoiiibVcKWg1iSSfcoToX4jx76zAKJHNq3jTnqcvLYasrckKGGuSIbuMU0ETK26/uofXs7BMF4sELoqlJFriWmg8Y2JlbTaNejTqbeuxqk+dQVlzkekSW696I56kgdBWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NM9jCQdy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NM9jCQdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788758098; x=1820294098;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q1JysKbMQrgBIrVbdgxw4Xm8SLloSRii2kC4G8MCMA4=;
  b=NM9jCQdy4GFsL3xjA5lUhJP2xU1i7E4QUeq65fzkFUjQ3UziVyvAB57d
   8QSbIZPjfHhf0uXSBwE62tAOQtMKg5OxZ6B1q66CrJHueqfnMc83Cq1wF
   9FwYFsOlKHScxJs0NwWn/eq1V0ZExPn75V0gEwH81r78GxqG0vh6hztVR
   5bWeoTIh44DlcPBKfYrHWpBYzHOhraj/GnvS2Z6eLUQXKu5suSyjcXuSV
   cWwe2a+Re1AyjAMak3IkaAvVudf+JzH+BiYXALp6wYqC6LGJbN68LVo1u
   p7Lh4j7XvADz7nAJE/7o/wrSe7mnMP08DaeXbb6PBWChoHR7t4l7kkPa5
   A==;
X-CSE-ConnectionGUID: 9/RCiMuRRgyTFgprxzHETg==
X-CSE-MsgGUID: PAl6VbaQQYaFf5JvV/+DEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88916191"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="88916191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 22:14:57 -0700
X-CSE-ConnectionGUID: u1aWbYMSRF+Hn4PHvRclLA==
X-CSE-MsgGUID: Tqz3MBJFRdy7DtPrlDxtpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="274125319"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.187]) ([10.245.245.187])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 22:14:54 -0700
Message-ID: <571135ef-fb87-4003-b4a1-253582d776a8@linux.intel.com>
Date: Mon, 7 Sep 2026 08:15:04 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/23] ASoC: SOF: Add support for IPC4 compressed
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-20-peter.ujfalusi@linux.intel.com>
 <apslMqkO9eXK0RL5@sirena.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <apslMqkO9eXK0RL5@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/09/2026 23:08, Mark Brown wrote:
> On Fri, Sep 04, 2026 at 10:31:30AM +0300, Peter Ujfalusi wrote:
>> Set and define the compressed ops for IPC4.
>> The initial implementation supports basic features: PAUSE PUSH/RELEASE,
>> DRAIN and progress reporting.
>> Tested with PCM, MP3, AAC and VORBIS codec.
> 
>> +static int sof_ipc4_compr_set_params(struct snd_soc_component *component,
>> +				     struct snd_compr_stream *cstream,
>> +				     struct snd_compr_params *params)
>> +{
> 
>> +	/* Use correct format based on the used codec */
>> +	switch (params->codec.id) {
>> +	case SND_AUDIOCODEC_PCM:
>> +		snd_mask_set_format(fmt, (snd_pcm_format_t)params->codec.format);
>> +		break;
> 
> Do we validate the value supplied by userspace here?

On SOF core side we do not, but on the Intel side in
hda_dsp_compr_hw_params() we might want to fail in case of S24_3LE,
which is not supported. by hardware.

-- 
Péter

