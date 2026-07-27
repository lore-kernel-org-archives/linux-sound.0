Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239137AA9C
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161806; cv=none; b=j49NL3UPmpHYEOyp1x+UyqOL+wxEhtJS+QynpFTmhKz90HhlwoL7uGNzvoUtzl+73sWrIGhDueyBhs+Dq20mnYhyG1kXzmIMB0CoArbmV5mF6ZdBENtZes0vb/zCilrz0gEv0PgiC0TfEv5SvlkhUZL/ZWH+0uewwRRIIY0uIaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161806; c=relaxed/simple;
	bh=JdZFQTAoyB0QDHV74U2TZ2nxKW2XF8TzhIiDGxi98dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuwHuMenXHXfwLF9RySHCyDFc9Jn3GUxkqBL2q6lf34P044TdgXPpQVm8AgbKkaN1pc9YIM7PYRxIt0frC0kv+N9RSAjfZb3DalbaUY84W1inZUlU1kWS3BU+ZlV70D71zaWsxx63TVJNW055lGGKk7Nhpwb11lj+Cv85x0aNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mKXKCnG5; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mKXKCnG5"
Message-ID: <c6b9b217-3678-42d8-8e01-7fdbf7c67c7a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785161798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFW1bf10XWbfMwb7QeDtECBeLMZ6ovpLefW06suqMis=;
	b=mKXKCnG5RbJOj25UQGVTtBMdmePuoe0Gf10/WU9z27+mfr8U/bjWMo3j2in7Q2wL4kFgfv
	/jTnZ7mJ6WmzIjzejuxVG+zAPiWDAUvlAYWdtn+YqwfOlnAFRf0LLTcCgxhcVvPeNHfZ4r
	7IRzE/H1nBGKRT/viYD2JXcB08aS21c=
Date: Mon, 27 Jul 2026 16:08:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: ASoC: tas2783-sdw: port prepare never completes after S0i3, no
 audio and no error (AMD ACP7.0, ASUS ProArt PX13)
To: Andrey Golovko <andrey.golovko@gmail.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mario Limonciello <superm1@kernel.org>, Antoine Monnet
 <antoine@montane.tech>, linux-kernel@vger.kernel.org,
 Niranjan H Y <niranjan.hy@ti.com>
References: <b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/27/26 11:33, Andrey Golovko wrote:
> Hi,
> 
> On an ASUS ProArt PX13 HN7306EAC (Ryzen AI MAX+ 395, AMD ACP rev 0x70,
> two TAS2783 at unique_id 0x8/0xB plus RT721 on SoundWire link 1), audio
> is silent after resume from s2idle whenever the platform actually reaches
> S0i3. Playback runs with no error whatsoever - no XRUN at first, no
> prepare failure, no bus error - and the speakers stay quiet until the PCM
> is fully torn down and recreated.
> 
> This is with v7.2-rc4 plus 5893013efabb ("ASoC: amd: ps: disable MSI on
> resume in ACP PCI driver"), which is what makes the peripherals re-attach
> at all on this board [1], and with a local fix that drops the stale
> tas2783 regcache on re-attach [2]. Both are necessary here; neither is
> sufficient.
> 
> I measured where the audio stops, and the answer is not where I expected.
> 
> 1. The ACP side is healthy
> --------------------------
> I dumped the ACP registers that the driver programs (ring buffer address
> and size, FIFO address and size, DMA size, watermark, stream enable, plus
> the SoundWire manager block) during actual playback, once in the silent
> state after resume and once after the workaround restored audio.
> 
> 72 of 78 registers are bit-identical. The only differences are
> ACP_EXTERNAL_INTR_CNTL (one extra bit, 0x10000 = PDM_DMA_INTR_MASK, i.e.
> the digital mics, unrelated to this stream) and the last immediate
> command/response pair on the bus.
> 
> That is expected: acp63_sdw_pcm_resume() reprograms the PTE, the ring
> buffer, the watermark and the DMA interrupt masks for every live
> substream on system resume. The ACP DMA configuration is restored
> correctly.
> 
> 2. The DMA is running at the correct rate while silent
> ------------------------------------------------------
> Sampling ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR every 500 ms during silent
> playback:
> 
>   0x000002FBF880  +96064
>   0x000002FD6F80  +96000
>   0x000002FEE6C0  +96064
>   0x000003005E00  +96064
>   0x00000301D500  +96000
> 
> 96000 bytes per 500 ms = 192000 B/s = 48000 Hz x 2 ch x 2 bytes, exactly
> nominal. The ACP is fetching the buffer and feeding the SoundWire FIFO
> the whole time the speakers are silent.
> 
> 3. The peripheral port never finishes preparing
> -----------------------------------------------
> Dumping /sys/kernel/debug/soundwire/master-0-1/sdw:*/registers during
> playback, silent state versus working state, the entire difference across
> all three peripherals is two registers - and it is the same register on
> both amplifiers:
> 
>   DP1 0x104 (DPn_PrepareStatus):  silent = 0x3   working = 0x0
> 
> with DPn_PrepareCtrl (0x105) = 0x3 and DPn_ChannelEn = 0x3 in both cases.
> (The third difference is SCP_Int1 on one amp, i.e. transient interrupt
> status.)
> 
> Per the core's own reading of that register - "Poll for NOT_PREPARED==0"
> in sdw_prep_deprep_slave_ports() - a set bit means the channel is *not*
> prepared. So after the power gate both amps sit with both channels
> unprepared, indefinitely, while the manager streams data at them.
> 
> 4. Why nothing complains
> ------------------------
> tas2783-sdw declares simple_ch_prep_sm, so the core skips its entire
> prepare block: it neither writes DPn_PrepareCtrl nor polls
> DPn_PrepareStatus. The driver writes DPn_PrepareCtrl itself from
> tas_port_prep() - as the comment there says, "TAS2783 requires explicit
> port prepare during playback stream setup even when simple_ch_prep_sm is
> enabled. Without this, the port fails to enter the prepared state
> resulting in no audio output" - but nobody ever checks whether the port
> actually reached the prepared state.
> 
> The result is a completely silent failure: the stream is enabled, the DMA
> runs, the log is clean, and there is no sound.
> 
> What restores it is a full teardown: hw_free (which de-prepares the port,
> writing DPn_PrepareCtrl = 0) followed by hw_params and a fresh prepare.
> Re-preparing without the de-prepare - which is what a plain userspace
> resume does - leaves DPn_PrepareStatus stuck. On this board I work around
> it by cycling the card profile after every resume, which forces that
> teardown.

Just to be clear: are you referring to a scenario where audio playback
is on-going, the device does a system suspend during the audio playback
due to a user request, and on resume audio is supposed to restart playing?

That's not an easy capability to test/automate. When I worked with
Intel, we had scripts to force a suspend-resume with aplay running in
the background. They worked most of the time except when they didn't...

> Questions
> ---------
>  - Should TAS2783 declare simple_ch_prep_sm at all? The port evidently
>    does not prepare instantaneously, which is the premise of that
>    property; letting the core do its normal write-and-poll would at least
>    turn this into a visible error instead of silence.
>  - If the property is correct, should tas_port_prep() poll
>    DPn_PrepareStatus after writing DPn_PrepareCtrl, mirroring what the
>    core does?

It'd be surprising, these registers are typically updated quickly and if
the sequence works for one playback it should work timing wise after resume.

Anyways, adding Niranjan H Y who contributed the patch "ASoC: tas2783A:
add explicit port prepare handling". The topic of this prepare bit was
discussed in the thread "SoundWire: Allow Prepare command for
Simplified_CP_SM" and we ended-up with the use of this port_prep
callback. IIRC the use of the simple_ch_prep_sm was due to Windows/BIOS
precedent.

Note that there was a change in the full port-prepare programming
sequence, we've since stopped using this interrupt due to other deadlock
problems (see "soundwire: stream: Poll for DP prepare to avoid interrupt
deadlock"). It could very well be that this driver can now use the full
state machine, who knows.

>  - Either way: why does a fresh prepare not complete after the device has
>    lost power, when a de-prepare followed by a prepare does? If the amp
>    needs the port explicitly de-prepared before it will accept a new
>    prepare after a power cycle, that sequencing has to happen somewhere
>    on resume.

It could be that the use of the port_prep callback is restricted to the
initial stream setup. I am not sure if that stream callback is invoked a
second time after a suspend-resume cycle, this driver is the only one
who makes use of that callback...

Alternatively it could be that something else remains stuck and prevents
the port prepare sequence from completing.


