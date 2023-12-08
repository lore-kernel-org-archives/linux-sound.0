Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR123yaP"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE96AFB
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 10:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702061125; x=1733597125;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=blvUZzpj2CREq+CAx85Qm2ONo2JCdPZE9zcWpmIEu8U=;
  b=eR123yaPdGCU5JChwjCvw57yW0H9UJQEAXnu+z1AtOVwwP6HH3IAMVv/
   ui85lwwlV766nsWXkJnuRFN79plQUHqf9+kGosd+O76GQ9dTWlrI0G8RL
   FMCr7FZQrbk47Vl5Hdj5hwMT3SfOIjEEH1cQDkwAb7hiUMaBYVL68qnJd
   cAQe1dCW5pvFW/c5YeHpIq18QDnNehdGaNruVzPAOiwU7+jFl9bHVekYy
   riXaltnQivOASjckf/VTWjxHxq50qa7oXpcHrAFxUtI3rNB1Cg3hhij6p
   gKOmRUJIBVr3FNDyJUgMUTPMi6Cb9XDiZJtq4IxVpHCDI5stiikOlbwx2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1568613"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1568613"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 10:45:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="945504345"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="945504345"
Received: from williamh-mobl.amr.corp.intel.com (HELO [10.212.151.176]) ([10.212.151.176])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 10:45:22 -0800
Message-ID: <4048c3a3-f694-41c2-b338-57e524544c92@linux.intel.com>
Date: Fri, 8 Dec 2023 12:45:21 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <20231208162735.GV14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231208162735.GV14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/8/23 10:27, Charles Keepax wrote:
> On Thu, Dec 07, 2023 at 04:29:29PM -0600, Pierre-Louis Bossart wrote:
>> The Bulk Register Access protocol was left as a TODO topic since
>> 2018. It's time to document this protocol and the design of its Linux
>> support.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>> +Concurrency between BRA and regular read/write
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The existing 'nread/nwrite' API already relies on a notion of start
>> +address and number of bytes, so it would be possible to extend this
>> +API with a 'hint' requesting BPT/BRA be used.
>> +
>> +However BRA transfers could be quite long, and the use of a single
>> +mutex for regular read/write and BRA is a show-stopper. Independent
>> +operation of the control/command and BRA transfers is a fundamental
>> +requirement, e.g. to change the volume level with the existing regmap
>> +interface while downloading firmware.
> 
> Is this definitely a show stopper? Not saying that it wouldn't be
> desirable to do both from a speed perspective, but current
> systems that download firmware (I2C/SPI) typically will block the
> bus for some amount of time. There are also some desirable properties
> to a single lock such as not needing to worry about accessing the
> same register in the bulk transfer and a normal command transfer.

There are other cases where we do want to interact with the device even
if we are in the middle of downloading stuff. We currently have a
msg_lock that's used to prevent multiple read/writes from being sent on
the bus, I really don't think it would be wise to use this same
"lightweight" lock for much longer transfers. This could impact response
to alerts, changes in state reported by the hardware, etc.

>> +Audio DMA support
>> +-----------------
>> +
>> +Some DMAs, such as HDaudio, require an audio format field to be
>> +set. This format is in turn used to define acceptable bursts. BPT/BRA
>> +support is not fully compatible with these definitions in that the
>> +format may vary between read and write commands.
>> +
>> +In addition, on Intel HDaudio Intel platforms the DMAs need to be
>> +programmed with a PCM format matching the bandwidth of the BPT/BRA
>> +transfer. The format is based on 48kHz 32-bit samples, and the number
>> +of channels varies to adjust the bandwidth. The notion of channel is
>> +completely notional since the data is not typical audio
>> +PCM. Programming channels helps reserve enough bandwidth and adjust
>> +FIFO sizes to avoid xruns. Note that the quality of service comes as a
>> +cost. Since all channels need to be present as a sample block, data
>> +sizes not aligned to 128-bytes are not supported.
> 
> Apologies but could you elaborate a litte on this? I am not sure
> I follow the reasoning, how does the 48k 32bit DMA implementation
> result in 128-byte limitation? I would have thought 1 channel would
> be 4-bytes and you are varying the channels so I would have expected
> 4-byte aligned maybe 8-byte if the DMA expects stereo pairs.

With the 50x4 default frame size that we're using, a BTP/BRA write
requires 13.824 Mbits/s for TX and 3.072Mbits/s for RX. We have to treat
these "non-audio' streams as respectively 10 and 2 channels of 48kHz
32bit data to reserve the equivalent PCM bandwidth, and that creates an
alignment requirement since the DMA expects all 'channels' to be present
in the same block.

We could try and play with parameters, e.g. I am not sure what happens
if we used 192kHz, maybe that reduces the alignment back to 32 bytes.
But the point is arbitrary sizes *cannot* be handled.

The HDaudio spec also mentions that for efficiency reason it's strongly
recommended to use 128-byte multiples.

> And what exactly do we mean by aligned, are we saying the length
> all transfers needs to be a multiple of 128-bytes?

Yes.

> I think we might have some annoying restrictions on the block
> size on our hardware as well I will go dig into that and report
> back.

That would be very useful indeed, we have to make sure this alignment is
reasonably supported across hosts and devices.
If we can't agree we'll have to make the alignment host-dependent, but
that will make the logic in codec drivers more complicated.
