Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7D1B3925
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745390755; cv=none; b=PqaM74Y6jD812kpmWG4yJ2KHY5+a+x+gr555ggao/dQ8dNC2GaDKWIXilwRMO02Dy4NprpRnOHgjhshwhv6v6CerfaGs87q8TkDrCNBDujuMH3yGBFBCKZS2OvbSC+zDA3o2iH2dlw4E7YAQ0srW8WObPc8hHdbPQNkoKqLclhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745390755; c=relaxed/simple;
	bh=dqyEobQQnCPzbNNQ2e9mYWspoXIhzh2gI8dzjRl9G5E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csInUDQrc8+U1sD55s07g8gRuiOFokHgewRWvEwLnOH//6n1XblJRNHYtZEAEkKe07TOgt9DfHl0bPUQD6hHg5C+frUXqxyW20arI+m+ttboQG+gyy3022xiQVfSGEbP3CgVGCE+VMUSl2N5Na3HZb61jWwUqwY+XUs/CYPCts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SdbbqcrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RQijb8mb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SdbbqcrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RQijb8mb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SdbbqcrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RQijb8mb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SdbbqcrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RQijb8mb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3AC371F38D;
	Wed, 23 Apr 2025 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745390752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qPUtpD/+SYVW/8/iKkKj2DDvXSt5L/b980tj36yB9sk=;
	b=SdbbqcrSjcgpjVW/XkPeG7j5Szjk4jrmH+JNaRqIQjOElvjkBh9/bPEcdQ2lhmvx297i30
	zSJqQxK8UZVV8tBTNO+k6EzlY28/zBrEJgasS/FtjwSnrduxa2RJSz/O5uG0a6EgQoiN2s
	hoc1jhXfAdGnY/3RvqnePJ6hIZOT/CQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745390752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qPUtpD/+SYVW/8/iKkKj2DDvXSt5L/b980tj36yB9sk=;
	b=RQijb8mbSweV4owbQKeLVNVmsoWLyKzUDtJlcfQ6CBixm8KTAnieFqr4kVNCLut+LYxHV9
	8cscTy6y6sLaGkCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745390752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qPUtpD/+SYVW/8/iKkKj2DDvXSt5L/b980tj36yB9sk=;
	b=SdbbqcrSjcgpjVW/XkPeG7j5Szjk4jrmH+JNaRqIQjOElvjkBh9/bPEcdQ2lhmvx297i30
	zSJqQxK8UZVV8tBTNO+k6EzlY28/zBrEJgasS/FtjwSnrduxa2RJSz/O5uG0a6EgQoiN2s
	hoc1jhXfAdGnY/3RvqnePJ6hIZOT/CQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745390752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qPUtpD/+SYVW/8/iKkKj2DDvXSt5L/b980tj36yB9sk=;
	b=RQijb8mbSweV4owbQKeLVNVmsoWLyKzUDtJlcfQ6CBixm8KTAnieFqr4kVNCLut+LYxHV9
	8cscTy6y6sLaGkCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DB9E13A3D;
	Wed, 23 Apr 2025 06:45:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NBoWBqCMCGjHWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 23 Apr 2025 06:45:52 +0000
Date: Wed, 23 Apr 2025 08:45:51 +0200
Message-ID: <871ptjl6jk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Davis <paul@linuxaudiosystems.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA USB MIDI port names are poorly constructed and truncate iJACK names
In-Reply-To: <CAFa_cKm3ded=1+3-i5BYjTa8JTeqZcGkGhakgQWfqPy_H=NBBg@mail.gmail.com>
References: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
	<878qnss187.wl-tiwai@suse.de>
	<CAFa_cKm3ded=1+3-i5BYjTa8JTeqZcGkGhakgQWfqPy_H=NBBg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 22 Apr 2025 19:31:59 +0200,
Paul Davis wrote:
> 
> This patch was developed using the Debian 6.12.12 kernel source, but I
> believe it works without changes for current git.
> 
> The approach taken is to always look for the iProduct name
> (umidi->card->shortname) in the iJACK name (jack_name). If not found,
> the code path is unchanged. If found, a different string format is
> used to create the port name, using only the jack name. Note that
> since finding the product name in the jack name implies the jack name
> is not default_jack_name, there is never any reason to use "number" in
> constructing the port name.
> 
> This generates the expected port names for several USB MIDI devices
> here, some of which have "product name in jack name" and some which do
> not:
> 
> % aplaymidi -l
>  Port    Client name                      Port name
>  14:0    Midi Through                     Midi Through Port-0
>  16:0    Scarlett 18i20 USB               Scarlett 18i20 USB MIDI 1
>  36:0    Keystation 88                    Keystation 88 MIDI 1
>  40:0    Launchkey MK4 49                 Launchkey MK4 49 MIDI In
>  40:1    Launchkey MK4 49                 Launchkey MK4 49 DAW In
>  44:0    MidiSport 2x2                    MidiSport 2x2 MIDI 1
>  44:1    MidiSport 2x2                    MidiSport 2x2 MIDI 2
> 
> 
> Signed-off-by: Paul Davis <paul@linuxaudiosystems.com>
> 
> --- midi.c.orig    2025-04-22 11:20:30.192338737 -0600
> +++ midi.c    2025-04-22 11:20:47.373155820 -0600
> @@ -1817,10 +1817,18 @@ static void snd_usbmidi_init_substream(s
>      }
> 
>      port_info = find_port_info(umidi, number);
> -    name_format = port_info ? port_info->name :
> -        (jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
> -    snprintf(substream->name, sizeof(substream->name),
> -         name_format, umidi->card->shortname, jack_name, number + 1);
> +
> +    if (strncmp (umidi->card->shortname, jack_name, strlen
> (umidi->card->shortname)) != 0) {
> +        name_format = port_info ? port_info->name :
> +            (jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
> +        snprintf(substream->name, sizeof(substream->name),
> +                 name_format, umidi->card->shortname, jack_name, number + 1);
> +    } else {
> +        /* The manufacturer included the iProduct name in the jack
> name, do not use both */
> +        name_format = port_info ? port_info->name : "%s";
> +        snprintf(substream->name, sizeof(substream->name),
> name_format, jack_name);
> +    }

Thanks for the patch.

However, dropping the number suffix will break the uniqueness.
For example, in your case above, MidiSport 2x2 will have two identical
port names, I suppose?

IMO, we should keep adding the suffix number unless the uniqueness is
guaranteed instead of blindly dropping.  Admittedly the current code
isn't in the best form and this also needs more modification, too.

Also, the pre-defined port names defined in snd_usb_midi_port_info[]
have the format like "%s Synth", too, and those should be adjusted, as
well.

Last but not least, after we get a final form, could you try to submit
a patch in the proper format as defined in
  Documentation/process/submitting-patches.rst?


thanks,

Takashi
