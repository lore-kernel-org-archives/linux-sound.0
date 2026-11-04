Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793213;
	b=PeXrOhbsfXeENoATUpkbYlWVtBJT5ZlzNN2EY3Wjl5J4bhuN/fbPhSum0Q+5dnZdpFe/
	 lz5xc+pCmD9+mmK7L1X/xArL+DSzjuJX+Utnol3+aKq1TYsBytt0MEbPdODG9+Y+e6qFE
	 BqD2WmyzBOOeLvfzjqUkSk+FGtD/RFbUhrdm4iBtT5OtXw6aUbBZwnjJbhQ+HWrI8MgSO
	 3JnqkJdooPLpLLOn/pppc7rYTlWaMCNsvomV1zS0mOAH6/F/ZsiKeQWmL0uljz6URs5Lh
	 NYUGk/S7a63X/TEQ8P4y16nLPbKIZV4lE+OMIp2NBHYzmSIm2rTwUau0iWleFrFXaaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793213;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=K3XuBnrGM9sjcbyr+vhPAVUTy0Q76eXEKQQ9/GBy7po=;
	b=BJw543sIqvDSV1A4dqclqNFaKPvmo9NWV8f2AyM5esSczAUZGcjcdzkvLS6sf0wZ3/YJ
	 aIVpd+YHFFlATR8l28PFVTvNHxj6hsk1QdPJv7opa2pRfSRcvrikacv3hAzSxb5/+wF0I
	 bBPB8JcBTW5TaeZYg88gKZVPtXl39BfIAlxklsAz/GlRDLdf/wFyF50ZliMXUZSLKpy8P
	 c52NOP8StRI1XGq24ZnyepWfHBYSYykOvNwx0RulzcqF93NgnLgcuhglo4GyASYuZ5jvh
	 /xXDNtk6lsUfkxQMOsky/B6Zs7Ieug1bmsvMUQ7wap81Cjd52TNrE9OV32lBMs9EOJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u8EFKRoE;
	arc=none smtp.remote-ip=91.218.175.134
Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB02606D802
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 11:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB02606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u8EFKRoE
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+A0/0+mkCu8UwikYOVQTTnJ2ULdHaDIJYUHPMTx6ARc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793793211; v=1; x=1794398011;
 b=u8EFKRoETood6w9kHal8izrceQgeK970LC7hBYJzH5K3VzPJfPuZzJRJQp1zDNWA0WKO+f/e
 fooZaZZLzLZ8vf11jpervjvXk8JKOeMsR+UdposM8SSvEVPI+txEVNsDf22aGUafXiv4uB+CBVy
 wUyZBYXdVIn6VE3GRJY1S4QI=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8301430ec0ad741;
	Wed, 04 Nov 2026 11:53:31 +0000
X-Mizu-Trace-ID: b8301430ec0ad741
X-Migadu-Flow: FLOW_OUT
Message-ID: <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev>
Date: Wed, 4 Nov 2026 12:52:40 +0100
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
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
 <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 10:14, Cezary Rojewski wrote:
> On 11/3/2026 6:20 PM, Pierre-Louis Bossart wrote:
>>
>>> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
>>> That's not the case for the avs-driver.  It simply asks: "is any PDI
>>> free?" and assigns it for the substream if one is found.
>>> No predefining.  Again, this aligns with how HDAudio streaming is done.
>> Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
>> PDI, no?
>>
>> All PDIs are created equal, a dynamic mapping doesn't make things more
>> efficient. It just makes things more complex to debug since you don't
>> have a fixed mapping between dailinks/stream/cpu_dai/PDI.
>>
>> Put differently, couldn't the AVS driver work around that fixed mapping
>> to avoid changes to legacy platforms that have shipped many moons ago?
> 
> Kind disagree on the debugging part.  Having SDW streaming follow
> closely to what is done for HDAudio from the beginning (no hardcodes)
> makes it easier for a developer to debug stuff.  OTOH if one of these
> two follows a completely different path, the developer has to have such
> hardcodes in mind when debugging the PCM code or even when looking at
> the topology.
> 
> At the same time, I'm not going anywhere and I do intend to work with
> Peter and Kai to update the common code. Simply put, such a refactor
> would be routed through SOF GH first.
The machine driver selects the first available cpu_dai when creating a
dailink. It doesn't really add much value to add a second level of
freedom to select PDIs, since in practice it'll select the first as
well. PDIs have no moral equivalent in HDaudio, it's a Cadence-specific  IP.

Also there is already a degree of freedom in the allocation of
stream_tag, which is used for DMA support. That one makes sense since
DMAs may be used for non-SoundWire things (HDMI, trace, probe, etc).

That's 2 degrees of freedom on 3 levels, do you really need full
configurability?
