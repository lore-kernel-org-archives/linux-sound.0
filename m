Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865070;
	b=btag8NY4qASxa1w51GsJkpb4XnCrqsJYbXAetZy5FCpGreqTOwPySWmSoUnEdgWBMZIk
	 c32o0dtaAbtKk/OcZFIKX2JfIcE6GRbcNkWaefZ6Vb3HWmd2JzopSxIxzNcD4phk6FBGO
	 Wxynb/8kRuxHydAK0OAKBEgSBVAZ1AIM785aCV4eIine0gYo2v9prAwQ8h6LekPHS36is
	 Xp1VNRN5YRhvyGPkf5qSIsO6BiJldKqVjOdcglTDk2cGVkjmpx+go0vNj6xpABwCpo/tm
	 LFfPjf95WuaWCN/p218kMaSYmjJPuPPROXQKcfEHeOV/O7GLfdAr2IMUZcrX9lVT6hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865070;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+h5/awXFnlauk8YJ17E3YksXFQO3qqzzQrC62pPcVCc=;
	b=QeTzQN2Q4k92EWEfy8oGKic5T6lxHhgA8xmhla6QliWEZ/WPsX9rmcMvFWNp26HAKnHO
	 rkI3xX1xK8vtgtQqwOQ7KiwWursOy59Bvd7ICizHjOo2MauxpeKitMem6d4kSANPZ9YhU
	 1QMUwhgETlR/TAOae+rFns5G5rfkkV8EbZvIPp0bIx1+Jotag6LdciQ7R+iMkgzSeDI8v
	 ckqHAKwNvwt5hx92SKffISlhust3mGl2UzRJI5sm5gMDkSAeQydoQ85va9Txpkk9679g/
	 4Z7yIvb4E3ihYhiad+R2X5JnxerIeqdT1hV+YyFKY49xQKCI/3Bu7QDysMWpEb9+bow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F0wuEydl;
	arc=none smtp.remote-ip=95.215.58.140
Received: from mta1.migadu.com (out-140.mta1.migadu.com [95.215.58.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF35606A31F
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 11:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F0wuEydl
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aBqUvGu+5flnqx//crjHG1aH6jJBAfbOuF98bZjHEhE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795865066; v=1; x=1796469866;
 b=F0wuEydlpggHdD5Z/nsVS0jA6umqp2H0QM2NYN530x7wGXQtexwAWMHEJ0mtEl5PCo4WUqfh
 aFDMb6/vtN1Hsx5FH2h88Zhhs2t8AMdwoDg6pRHFpJYbQkEay6KRIiJ0TUHrL0L0e7wlEgIBiog
 6MeSoIe63mUSaU09dq0Rhqvs=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ea6ef8fdfe7c31ea;
	Sat, 28 Nov 2026 11:24:26 +0000
X-Mizu-Trace-ID: ea6ef8fdfe7c31ea
X-Migadu-Flow: FLOW_OUT
Message-ID: <ff36b846-988f-4da1-bd12-f15b5fec87e3@linux.dev>
Date: Sat, 28 Nov 2026 12:21:43 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soundwire: Suspend and resume asynchronously
To: Paul Menzel <pmenzel@molgen.mpg.de>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261127150101.48880-1-pmenzel@molgen.mpg.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261127150101.48880-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/27/26 16:00, Paul Menzel wrote:
> On system resume, the SoundWire devices are resumed synchronously, so the
> codecs on different links wait for each other’s re-enumeration, and the
> whole audio subtree waits for every synchronous device before it in
> dpm_list. On a Dell XPS 9315 (Alder Lake, SOF, RT1316 on link 2, RT714 on
> link 3), the four resume callbacks run one after the other, in one cycle:
> 
>     soundwire_intel.link.2     2.2 ms
>     sdw:0:2:025d:1316:01      16.3 ms
>     soundwire_intel.link.3     2.2 ms
>     sdw:0:3:025d:0714:01       9.9 ms
> 
> Their span is 28.9 ms. With both patches, the callbacks overlap, and the
> span drops to 17.1 ms (median of five s2idle cycles each, sleepgraph with
> the device callback trace events). It is on the critical path of the resume
> with the panel on, right behind SOF, which waits for i915 through its
> device link.
> 
> Patch 1 marks the generic manager and peripheral devices, patch 2 the Intel
> link devices. The SHIM registers are shared by the links; patch 2 explains
> why the multi-link SYNC arm and SYNCGO sequence in intel_start_bus()
> tolerates two links interleaving. It is the part I am least sure about, so
> please check it. The second link’s power-up waits on shim_lock, so in 49 of
> 50 traced cycles the start-up was serial anyway; in one cycle both links
> were armed before the first SYNCGO, and the bus came up fine. If you
> prefer, I can serialize intel_start_bus() across links instead; it takes
> about 0.1 ms per link.
> 
> Not tested: AMD and Qualcomm managers, and peripherals of other codec
> drivers. Patch 1 changes the ordering against synchronous devices that are
> neither descendants nor device-link consumers of the peripherals. The
> WCD93xx codecs have device links. The deferred resume work of the ASoC card
> can now run while a codec still waits for its re-initialization; with the
> RT1316 and RT715 SDCA drivers, its register writes then end up in the
> regmap cache, which the codec syncs afterwards. I checked the other drivers
> only by reading the code. Suspend is now asynchronous as well, which I did
> not measure.
> 
> Tested on the Dell XPS 9315 with 7.4-rc4, these and unrelated resume
> patches: 50 s2idle cycles, each followed by 1 s of playback to the RT1316
> and 1 s of capture from the RT714 (non-zero samples), with no errors in the
> log; also 30 resume stress cycles in an earlier run. The series is based on
> soundwire/next and only compile-tested there (W=1).
> 
> The analysis, the patches and the messages were drafted with
> claude-opus-5-5 (Claude Code), asked to cut the s2idle resume time of the
> laptop, see Documentation/process/generated-content.rst.
> 
> Paul Menzel (2):
>   soundwire: Suspend and resume managers and peripherals asynchronously
>   soundwire: intel: Suspend and resume the links asynchronously
> 
>  drivers/soundwire/intel_init.c | 3 +++
>  drivers/soundwire/master.c     | 3 +++

This is a very interesting patchset, thanks for posting this.
I didn't know one could speed-up the suspend-resume time this way.

For managers, I think it's fine, at least on the Intel side I can't
think of any dependencies, and you're correctly pointed out the mutual
exclusion handled with the shim_lock.

>  drivers/soundwire/slave.c      | 6 ++++++
For peripherals, I would recommend more analysis/measurements - things
are less clear.

Yes in theory all peripherals are independent, but the command/control
channel used for reconfiguring the registers is *serial*. You can really
only send one byte to one peripheral at a given time on the bus - and
there's a msg_lock to that effect.

If you resume multiple peripherals on the same link, the regmap_sync()
may be less efficient with additional overhead due to the mutual exclusion.

It's worse if the devices require firmware download with the BPT
protocol, which is also typically more efficient if only one transfer
takes place for a single resume. IOW serialization of the resume isn't
necessarily a bad idea given the low-level limitations of the bus.

The figures above show the resume time is about an order of magnitude
longer for the peripheral than the manager, so additional data on the
async resume of multiple peripherals on the same link would be very useful.

Do you have access to a platform with multiple amps on the same link?
If not Bard may have some in the Intel CI?

At any rate, I would isolate the change for the peripheral in a
stand-alone patch to allow for easier tests/bisect.
