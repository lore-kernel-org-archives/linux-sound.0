Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F861A3BC8
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339977; cv=none; b=DUegw1KNJ2sgSMeeaJ11aIXpeupvoRFCLeeKaYoPMr2cU7NDbWx513/LuE3RlK0IWqV+mTm6FrYhIfjrLrLLjqdpH3gYTuzL5SVTL8uwCEJoryXSndR8CTodVrqfVktuFSs+IUsdUDD+gsXFlCHC3b2J5rPLtzL+W9XbU3nNVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339977; c=relaxed/simple;
	bh=ENhVlm5z1c38Bwm5WCm4jIh1h1RFWVBTij5tZ5reNl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZ8SAO3RwTq7jpue1oG4xVAYpMDZvQ3ozQBUUEYRxc08qiIAx8Rlf6z5W0j7H1SJM4npOkun2j/Y6dBvAAeNR19YfHufwWhDzbIM80eSGUaXkJPc56SJR/lzInCvKSkEWxkJ6B4gSC5U4dkAWnQ/IdzVDbUEp0vnr0YJgESNIW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=o2VykogO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sbVxb0nD; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="o2VykogO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sbVxb0nD"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4292E11406BD;
	Tue, 30 Jul 2024 07:46:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 30 Jul 2024 07:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1722339973; x=
	1722426373; bh=iefsEGpHVlqq7CDg5X+Pi4Watsk5tFu1X0BI8hP/BOU=; b=o
	2VykogOxTw0K6YszGtXFavrSwCSnNJ0fcfQFLb8c1J62eX/B615C+XzsLPA11GNL
	paVvvle7JbWzZx68wMti66apiovwHONz2pHLYzHX5YT6Md/N2/yIx9f0WhNWB5UW
	KdHd9BKOsT5aboAGaC07r694nifQnF4/ojI3ELhm4kYXcM5Y0HAYmo+q0cZuLI8B
	qlF5CCdKgTki4SCuTCGX101ZCzOGYolol6L3TGo2WiV/jSv8pKB23qHrxNdjKMBJ
	0eUxVSTGwjXVv7NMhE6DBTNl7xV0wE0UKZWAuLw/b6Zusom4mdWuidI2tTpNnQS+
	snkxqYyi6vmq/QO0bFThw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722339973; x=1722426373; bh=iefsEGpHVlqq7CDg5X+Pi4Watsk5
	tFu1X0BI8hP/BOU=; b=sbVxb0nDK7Sa+vve3/VEOxNinI0/8LrsT6hqOl+8xA3C
	borTp1s3GIqIgsSAUV90VDAq+HvQXv5th/dpxj5e9McXryDztVMpdmNqYafNObl0
	UBeGa2rq9I92fmsf+Bhs3ferVdWAPRl7G+HwZotoFCPFOnedzmVK+IExLEk/v0g1
	fBnuAAjRiUgonaIgTlvfmG0hFziHaN70ma0vFo5i4GiEaPL4oXSaUF67Q0XrdsWt
	4+GDIOhCtTj8Ad6LoEqKY2b7accrvez7dtqsDkiqCdS82F3Xqq+JKlVdaPkObvor
	L2iLD24DN75GZzXGr++O5GL6a+OTx8+pu1lt8rfOxA==
X-ME-Sender: <xms:hNKoZkQx8Q-dXLvW15F4_qi8B7lwCXb1eJqPW-CLk295tUHcN5G6Yg>
    <xme:hNKoZhwumybvAUplegvwEgurplphzQmME_sBbS2jlIGUBpWB1AodgDF3Tb3IfSBzl
    N8D51BC7WE1KSPc8sY>
X-ME-Received: <xmr:hNKoZh0isJzzVpeh444qXFIHCbnpSkJ4p5y5u28s-nUpZ7biiuHm-rT7p17UJMKeR31c8qDXOraBwSNDtGLBnafzoAIxD1_0_pJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeeggdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeevieelhfdukeffheekffduudevvdefudelleefgeei
    leejheejuedvgefhteevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:hNKoZoAARNNZ70WX_IV9vHa-FfFD4ZUPGbKfL3LrpwgJVNsBinrJBA>
    <xmx:hNKoZtj6qr5Qmv2iIPOatqBAbTPD9H67ayhuyYb2dbOyhInEQGo-Tw>
    <xmx:hNKoZkp6MdyF5qBuOuhoxCratAgQo5blzw-_q_gxrStUXuK_xqjHgw>
    <xmx:hNKoZggfxY_15cINy0YsjrYL24R1hUf05N8Gfp7DyhjwjIvAtjtqKA>
    <xmx:hdKoZteGyL-kGhFZbULAT97asYih7oxixtXwX-16PcpTkS8SszcewKR->
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jul 2024 07:46:11 -0400 (EDT)
Date: Tue, 30 Jul 2024 20:46:09 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Edmund Raile <edmund.raile@protonmail.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ALSA: firewire-lib: restore process context
 workqueue to prevent deadlock
Message-ID: <20240730114609.GA139690@workstation.local>
Mail-Followup-To: Edmund Raile <edmund.raile@protonmail.com>,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
References: <20240729214149.752663-1-edmund.raile@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729214149.752663-1-edmund.raile@protonmail.com>

Hi,

On Mon, Jul 29, 2024 at 09:42:02PM +0000, Edmund Raile wrote:
> This patchset serves to prevent an AB/BA deadlock:
> 
> thread 0:
>     * (lock A) acquire substream lock by
> 	snd_pcm_stream_lock_irq() in
> 	snd_pcm_status64()
>     * (lock B) wait for tasklet to finish by calling
>     	tasklet_unlock_spin_wait() in
> 	tasklet_disable_in_atomic() in
> 	ohci_flush_iso_completions() of ohci.c
> 
> thread 1:
>     * (lock B) enter tasklet
>     * (lock A) attempt to acquire substream lock,
>     	waiting for it to be released:
> 	snd_pcm_stream_lock_irqsave() in
>     	snd_pcm_period_elapsed() in
> 	update_pcm_pointers() in
> 	process_ctx_payloads() in
> 	process_rx_packets() of amdtp-stream.c
> 
> ? tasklet_unlock_spin_wait
>  </NMI>
>  <TASK>
> ohci_flush_iso_completions firewire_ohci
> amdtp_domain_stream_pcm_pointer snd_firewire_lib
> snd_pcm_update_hw_ptr0 snd_pcm
> snd_pcm_status64 snd_pcm
> 
> ? native_queued_spin_lock_slowpath
>  </NMI>
>  <IRQ>
> _raw_spin_lock_irqsave
> snd_pcm_period_elapsed snd_pcm
> process_rx_packets snd_firewire_lib
> irq_target_callback snd_firewire_lib
> handle_it_packet firewire_ohci
> context_tasklet firewire_ohci
> 
> The issue has been reported as a regression of kernel 5.14:
> Link: https://lore.kernel.org/regressions/kwryofzdmjvzkuw6j3clftsxmoolynljztxqwg76hzeo4simnl@jn3eo7pe642q/T/#u
> ("[REGRESSION] ALSA: firewire-lib: snd_pcm_period_elapsed deadlock with
> Fireface 800")
> 
> Commit 7ba5ca32fe6e ("ALSA: firewire-lib: operate for period elapse event
> in process context") removed the process context workqueue from
> amdtp_domain_stream_pcm_pointer() and update_pcm_pointers() to remove
> its overhead.
> Commit b5b519965c4c ("ALSA: firewire-lib: obsolete workqueue for period
> update") belongs to the same patch series and removed
> the now-unused workqueue entirely.
> 
> Though being observed on RME Fireface 800, this issue would affect all
> Firewire audio interfaces using ohci amdtp + pcm streaming.
> 
> ALSA streaming, especially under intensive CPU load will reveal this issue
> the soonest due to issuing more hardIRQs, with time to occurrence ranging
> from 2 secons to 30 minutes after starting playback.
> 
> to reproduce the issue:
> direct ALSA playback to the device:
>   mpv --audio-device=alsa/sysdefault:CARD=Fireface800 Spor-Ignition.flac
> Time to occurrence: 2s to 30m
> Likelihood increased by:
>   - high CPU load
>     stress --cpu $(nproc)
>   - switching between applications via workspaces
>     tested with i915 in Xfce
> PulsaAudio / PipeWire conceal the issue as they run PCM substream
> without period wakeup mode, issuing less hardIRQs.
> 
> Cc: stable@vger.kernel.org
> Backport note:
> Also applies to and fixes on (tested):
> 6.10.2, 6.9.12, 6.6.43, 6.1.102, 5.15.164
> 
> Edmund Raile (3):
>   Revert "ALSA: firewire-lib: obsolete workqueue for period update"
>   Revert "ALSA: firewire-lib: operate for period elapse event in process
>     context"
>   ALSA: firewire-lib: amdtp-stream work queue inline description
> 
>  sound/firewire/amdtp-stream.c | 38 ++++++++++++++++++++++-------------
>  sound/firewire/amdtp-stream.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)

In my opinion, the patch just to change code comment is not preferable
to apply stable and longterm kernels as fixes. It is acceptable to
revise revert commits with slight changes to optimize codes and comments
to current status, thus I would like you to amend the second and third
patches so that the patchset consists of two revert commits.

I'm sorry to make many requests to you, however it is a community for
software development to which we are involved. It has some implicit and
explicit conventions to which we could follow.


Thanks

Takashi Sakamoto
