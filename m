Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438124734D3;
	Thu, 20 Aug 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787233468; cv=none; b=UlGTke+DCoBp2dV3u7MOpVbOB9yWsE1kLZ7G3eSSbnGpAONDsralAkYJlP0mtZ4+Vd/2dxwUFz/q6urZbPwMvAofdlMZUsIvy83YqHkOsHGHpSh4nPKIdIxyMWFEfVpo1rfRp43StYaShwQL1QDyU6+iHbwA+60YB11u2wUBSFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787233468; c=relaxed/simple;
	bh=04XAV8MqMleVYDpSiIHSHNBW75D6NVq8w+VHiA17JTM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMBpu84VcaLtxp/pvl0uZQw2vjNnSdaCGTLZtbsg03u6KVdnRjbQRRu5+eOFYUvhrPjIYvgkFqMrOZw9AfIfCLMGL6IVwlHd88h2MZEi9z+udPIRJMkznLhCRKc1JkeY4GWYf77jDt2E2Tj8/ZwOLd9eqJRm8QPmxb3udmJ4oCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KJB1IhWU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QMZgitXs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y95lzoHp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9PFyzwKK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KJB1IhWU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QMZgitXs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y95lzoHp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9PFyzwKK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F35F3ED2;
	Thu, 20 Aug 2026 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787233461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SFBcAy7hpfrt0N0n9Hr0uw2Gg5Kb3bSoiXrob7mzwg=;
	b=KJB1IhWUk13EmPlU6P/DKCh6hF3YrzzKopc8s5poxBg8ndTvbUQOiwAnDMt4kwlnIofMgI
	40TCIPDPMOyoG8/mlnwnb5K4kyWRhl8fwTAQMWaG7XQiDw96ADdqb0vq3F26Uo9wyFiqqa
	LyC2EIcpH9jBK+GSoOrs9Qlcnt6AFGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787233461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SFBcAy7hpfrt0N0n9Hr0uw2Gg5Kb3bSoiXrob7mzwg=;
	b=QMZgitXsY6s/Le0pmD+D45wlTMQO1KcNXl73qNy6sNS9GHo12x1JMsP7hVGxhGOJEPPShn
	s98ygN8Z8TO01ABQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787233457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SFBcAy7hpfrt0N0n9Hr0uw2Gg5Kb3bSoiXrob7mzwg=;
	b=y95lzoHpNsRkpN06Goa9hnuwcsyduodTJMmMf/vlHfWzBJuAe3KKqmfA9ZY5d/7/1s1LVB
	4UI/j/5PXeig3FksQzob41xeaEmjAf38hAqqDICKMqWNWxvjpfZXp0KqtNuKnBv5lPDSzZ
	4yzuwnnuDCgiLB7Qbg7HM+7+7wiyWqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787233457;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SFBcAy7hpfrt0N0n9Hr0uw2Gg5Kb3bSoiXrob7mzwg=;
	b=9PFyzwKKf7LgS58NQz+XuHHLbdpSUqeTe1XZBJ39BiC2utYTeLOtgqOr6yzBiYCO70EIED
	HzHLdpmesyIKwuDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFD1F27A8;
	Thu, 20 Aug 2026 13:44:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SdUyNbAEh2rNQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Aug 2026 13:44:16 +0000
Date: Thu, 20 Aug 2026 15:44:16 +0200
Message-ID: <87v794lxe7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Fix bass speaker DAC routing for Lenovo Yoga Pro 9 16IAH10
In-Reply-To: <20260820130644.76093-1-zhangheng@kylinos.cn>
References: <20260820130644.76093-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 20 Aug 2026 15:06:43 +0200,
Zhang Heng wrote:
> 
> The Lenovo Yoga Pro 9 16IAH10 (PCI SSID 17aa:3846, codec SSID 17aa:3920)
> uses a TAS2781 smart amplifier driven via the ALC287 codec.  On this
> machine the bass speaker pin (NID 0x17) is by default routed to DAC 0x03,
> which has no volume amplifier capability, resulting in the right-side
> woofer being barely audible while only the tweeter plays.  The Windows
> driver configures NID 0x17 to DAC 0x02, which is shared with the main
> speaker and carries proper amp control.
> 
> Currently this machine has no PCI SSID quirk, so it falls through to the
> codec SSID fallback and matches the existing 0x17aa:0x3920 entry intended
> for the Yoga S990-16, applying only the TAS2781 I2C init without the DAC
> routing fix.
> 
> Add a dedicated quirk for PCI SSID 17aa:3846 that forces NID 0x17 to DAC
> 0x02 via alc285_fixup_speaker2_to_dac1() and chains to
> ALC287_FIXUP_TXNW2781_I2C so the TAS2781 amplifier initialization is
> preserved.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220540
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied both patches now.  Thanks.


Takashi
