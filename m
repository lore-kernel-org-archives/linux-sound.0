Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B342A2253EC
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760796840; cv=none; b=mSBIV3d60js/2sG6o/NMQRz2Jz2+bcMnzK0SywjMuoGH6q/AKTFypPtIVaR9DN+i7j8OB3hn2Zrm+ucrAKecxDpkX6XUnHI7wHVB/tht80/NJmpB1IN6RSQiFFoY9RUSkxk/iur0j6+cCmfQT1YyxBU+5gKhy0BDKGl5+CFuRE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760796840; c=relaxed/simple;
	bh=9HCv2fHkolOIw6veuRl5TQ3jP6x3TpwV6X1fTlkaDck=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKdqm2Tzwb8k8gCrqr/7s9sUXgmXWR2xn3uVxXsj4Fq+jX01ZIuQYMqeu841sJizVk2N6KVd0vwWogiJkBh+MIAo5B4BbnKnZyz8SmpnioGBhbQQz73rvu64PvbafCbnpMO0wMkbgy4llx2lZGTaFC1phWv02P4hDkUn4mLa+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bqLkLuee; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1U7movTd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CepUGGc9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s191SAsx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bqLkLuee";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1U7movTd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CepUGGc9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s191SAsx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8508421C28;
	Sat, 18 Oct 2025 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760796832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mhaYj7KoNKRohnpNAKcS9lPquzJiYUd/ovPhXyaBq4I=;
	b=bqLkLueeoH3yKcOpUMTV2+GewhWILr5zOG+Gdq4MwU18HQ68KRy54eIuJMGaFrzVazRaeD
	dvyM+azzSRIxnPs2M/+iyxKBcIfBm7TiozYd7+Q9hdo824Z21X01mlxACPQgfzteKgCZi5
	SfmX+M6R/H2AYUWyeelStDMKWg+gfn4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760796832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mhaYj7KoNKRohnpNAKcS9lPquzJiYUd/ovPhXyaBq4I=;
	b=1U7movTd2s8e70MBxr6uheVJo3hmw5tjCqj5u49/NzN3m4Nk9WB/eTn6Hmn1FJWfmA9A93
	qhvuoW3/gLNmfhBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760796828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mhaYj7KoNKRohnpNAKcS9lPquzJiYUd/ovPhXyaBq4I=;
	b=CepUGGc9YzlkulPweg/vbWcQi+vQwHGEl310OxGoJKBty2mo4hsvP1KZJEC4McM4PRtvBS
	Mo0rkRppDNW8t9AVLli4FdNqn0deMplEEZBycP6Bg30BU/vS037gv4LqaqJP1d3OT7FEtm
	xicHXwk+YNMVjQUv8AsXcs3euKKPZko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760796828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mhaYj7KoNKRohnpNAKcS9lPquzJiYUd/ovPhXyaBq4I=;
	b=s191SAsx4XYaSIpNDX70g+qsZsND97xlmin0608wxmWB735lZPHBpZqxYMfdX9lCLL6xMo
	2lCiyJNSlRMHkUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56A421386E;
	Sat, 18 Oct 2025 14:13:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zSxXE5yg82jfCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Oct 2025 14:13:48 +0000
Date: Sat, 18 Oct 2025 16:13:47 +0200
Message-ID: <87tszw47s4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: J-Donald Tournier <jdtournier@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
In-Reply-To: <CAHgym8KzzwL_TWXEPa=-BQmo=uCaC8vbKm95v48roe0BbwRiKw@mail.gmail.com>
References: <CAHgym8KzzwL_TWXEPa=-BQmo=uCaC8vbKm95v48roe0BbwRiKw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 18 Oct 2025 16:00:38 +0200,
J-Donald Tournier wrote:
> 
> This laptop requires the same quirk as Lenovo Yoga9 14IAP7 for
> fixing the bass speaker problems.
> 
> Use HDA_CODEC_QUIRK to match on the codec SSID to avoid conflict with
> the Lenovo Legion Slim 7 16IRH8, which has the same PCI SSID.

Could you resubmit the patch with your Signed-off-by tag?  It's a
legal requirement.  The code change itself looks good.


thanks,

Takashi
