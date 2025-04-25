Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62112268FC2
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593861; cv=none; b=f0+sK/o5oIAoxE8G76TP+YPSZoeCRVTPT6FB4SdZgozN9PkF2KDJWXRDShIjtlr+kl7mUEUhstbZs4ytCht4AW/4F/Mm9XmfUhQUrIcFl0lq9cdNMmwMeaB+ANQMDrOW7ubRDVuo5HB6GLcH3W9s3iN7Z/BOHJzB3eMEU07YcOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593861; c=relaxed/simple;
	bh=92TAH3Np5DiIkgtaNdO0427UFvxHKpVywZ1Si44fRJU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tvOQCs7A2eJ1E/kMCK71u89t+S5/zWSkrooNtNRMBlydGu+g0why6pdaduPvXX2I2ouCHKvB9g2oNdzeIerYsvbqbzlKW7ei/uYH4Uz7kVFr732KzLnF4cW0U2NsG5piv1BND1kNCA5f0tiDERYeW9tkU6ALuEQWRnrlAbEJwnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hjVFVE67; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zN451FQ0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=foqHzcqm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m4I7DN8Q; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hjVFVE67";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zN451FQ0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="foqHzcqm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m4I7DN8Q"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DEB2821174;
	Fri, 25 Apr 2025 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745593857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClPH+I+RISyVanaAh971FCL3owbV9u5/bCt++UJWjAg=;
	b=hjVFVE67Cur2LdsUEk9Duu1R+09ep/UuX+CagDJzTKiiaLzwP/5CWvWDqnzcbImmoMePtz
	F/R7SbuiZzqBhegJBjgS2AnzoHrD6KpcB19VueSM59935msLUSN0bKTp9FiaaX88Yv25wz
	skV8zPGGWbxqY4H5e64MBwB32MeaZJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745593857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClPH+I+RISyVanaAh971FCL3owbV9u5/bCt++UJWjAg=;
	b=zN451FQ04s2lrdtj+o3KaMlIgKfvTtD8mJ4rS6/w2DAqBhQpgKKEOiKlx1+gFPwW5/6ym8
	hOrWdZXUJGSvfgBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=foqHzcqm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m4I7DN8Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745593856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClPH+I+RISyVanaAh971FCL3owbV9u5/bCt++UJWjAg=;
	b=foqHzcqmTaD6iszf2LmyuSYgH42ovF6LVbuPzzZuvVrMjr5X89OxJQsF1FVstpN9lWFup1
	hD2OVGGp+iK9Wnkmu0oeycCuy8TemRucPpqk5HXUGKq/7cGldcTgHbLoNkqkr3r5OLmcjs
	IRJ4nSUSc2t8L4Wv6x9USEO5qApoUDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745593856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ClPH+I+RISyVanaAh971FCL3owbV9u5/bCt++UJWjAg=;
	b=m4I7DN8QrOqEOGQZ08gJBBHIK+/kraQ9Yw7R+d/flHEd8mS3oFMHWW6+PGY5lSReMhVBUQ
	RSjU0q0TR9k2MaBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B46461388F;
	Fri, 25 Apr 2025 15:10:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 50nRKgCmC2jAbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 25 Apr 2025 15:10:56 +0000
Date: Fri, 25 Apr 2025 17:10:56 +0200
Message-ID: <87ikms1dkv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Davis <paul@linuxaudiosystems.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA USB MIDI port names are poorly constructed and truncate iJACK names
In-Reply-To: <CAFa_cKksYTido4z46UbiCN-s1Ebn=_fWt31ASOKfV0Zr_jo4YQ@mail.gmail.com>
References: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
	<878qnss187.wl-tiwai@suse.de>
	<CAFa_cKm3ded=1+3-i5BYjTa8JTeqZcGkGhakgQWfqPy_H=NBBg@mail.gmail.com>
	<871ptjl6jk.wl-tiwai@suse.de>
	<CAFa_cKksYTido4z46UbiCN-s1Ebn=_fWt31ASOKfV0Zr_jo4YQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DEB2821174
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxaudiosystems.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Fri, 25 Apr 2025 16:39:59 +0200,
Paul Davis wrote:
> 
> No, this is not correct.
> 
> The number is only used when constructing a "default jack name" as in
> "SHORT_DEVICE_NAME MIDI NUMBER". It is never used when the jack name
> is given by the manufacturer.
> 
> In the case of the Midisport 2x2, for example, the manufacturer does
> not provide jack names, and so we create "Midisport 2x2 MIDI 1" and
> "Midisport 2x2 MIDI 2". You can see this in the example output I
> provided.
> 
> If the manufacturer has provided the jack name, the code already
> assumed that the jack names will be unique (because otherwise things
> would just break on Windows and macOS, and because they bothered to
> provide names). And if the jack name includes the product name, even
> more reason to continue with this assumption.

Ah OK, now it's clearer.  In anyway, if you give the result after your
patch for comparison, it'll give a better demonstration.

But another point about the predefined port_info is still valid, I
suppose.  snd_usbmidi_port_info[] provides the own format strings, and
they are all like "%s Tone Generator", where "%s" should be filled
with the shortname, and not jack_name.

So, when port_info is defined, we should skip the duplicated word
check.  That being said, the change can be something like:

-- 8< --
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1885,10 +1885,18 @@ static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
 	}
 
 	port_info = find_port_info(umidi, number);
-	name_format = port_info ? port_info->name :
-		(jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
-	snprintf(substream->name, sizeof(substream->name),
-		 name_format, umidi->card->shortname, jack_name, number + 1);
+	if (port_info || jack_name == default_jack_name ||
+	    strncmp(umidi->card->shortname, jack_name, strlen(umidi->card->shortname)) != 0) {
+		name_format = port_info ? port_info->name :
+			(jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
+		snprintf(substream->name, sizeof(substream->name),
+			 name_format, umidi->card->shortname, jack_name, number + 1);
+	} else {
+		/* The manufacturer included the iProduct name in the jack
+		 * name, do not use both
+		 */
+		strscpy(substream->name, jack_name);
+	}
 
 	*rsubstream = substream;
 }
-- 8< --

> I realized after I sent the patch that I had run diff -uRN at the
> wrong level of the source tree, but I did read the doc and other than
> that, I think there were no other errors? I run a standard debian
> kernel and so am not working with git.

Indeed, the patch level isn't right, but the biggest problem is that
tabs/spaces are broken (possibly due to your mailer), so it can't be
applied as is, unfortunately.


thanks,

Takashi

> On Wed, Apr 23, 2025 at 12:45 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Tue, 22 Apr 2025 19:31:59 +0200,
> > Paul Davis wrote:
> > >
> > > This patch was developed using the Debian 6.12.12 kernel source, but I
> > > believe it works without changes for current git.
> > >
> > > The approach taken is to always look for the iProduct name
> > > (umidi->card->shortname) in the iJACK name (jack_name). If not found,
> > > the code path is unchanged. If found, a different string format is
> > > used to create the port name, using only the jack name. Note that
> > > since finding the product name in the jack name implies the jack name
> > > is not default_jack_name, there is never any reason to use "number" in
> > > constructing the port name.
> > >
> > > This generates the expected port names for several USB MIDI devices
> > > here, some of which have "product name in jack name" and some which do
> > > not:
> > >
> > > % aplaymidi -l
> > >  Port    Client name                      Port name
> > >  14:0    Midi Through                     Midi Through Port-0
> > >  16:0    Scarlett 18i20 USB               Scarlett 18i20 USB MIDI 1
> > >  36:0    Keystation 88                    Keystation 88 MIDI 1
> > >  40:0    Launchkey MK4 49                 Launchkey MK4 49 MIDI In
> > >  40:1    Launchkey MK4 49                 Launchkey MK4 49 DAW In
> > >  44:0    MidiSport 2x2                    MidiSport 2x2 MIDI 1
> > >  44:1    MidiSport 2x2                    MidiSport 2x2 MIDI 2
> > >
> > >
> > > Signed-off-by: Paul Davis <paul@linuxaudiosystems.com>
> > >
> > > --- midi.c.orig    2025-04-22 11:20:30.192338737 -0600
> > > +++ midi.c    2025-04-22 11:20:47.373155820 -0600
> > > @@ -1817,10 +1817,18 @@ static void snd_usbmidi_init_substream(s
> > >      }
> > >
> > >      port_info = find_port_info(umidi, number);
> > > -    name_format = port_info ? port_info->name :
> > > -        (jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
> > > -    snprintf(substream->name, sizeof(substream->name),
> > > -         name_format, umidi->card->shortname, jack_name, number + 1);
> > > +
> > > +    if (strncmp (umidi->card->shortname, jack_name, strlen
> > > (umidi->card->shortname)) != 0) {
> > > +        name_format = port_info ? port_info->name :
> > > +            (jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
> > > +        snprintf(substream->name, sizeof(substream->name),
> > > +                 name_format, umidi->card->shortname, jack_name, number + 1);
> > > +    } else {
> > > +        /* The manufacturer included the iProduct name in the jack
> > > name, do not use both */
> > > +        name_format = port_info ? port_info->name : "%s";
> > > +        snprintf(substream->name, sizeof(substream->name),
> > > name_format, jack_name);
> > > +    }
> >
> > Thanks for the patch.
> >
> > However, dropping the number suffix will break the uniqueness.
> > For example, in your case above, MidiSport 2x2 will have two identical
> > port names, I suppose?
> >
> > IMO, we should keep adding the suffix number unless the uniqueness is
> > guaranteed instead of blindly dropping.  Admittedly the current code
> > isn't in the best form and this also needs more modification, too.
> >
> > Also, the pre-defined port names defined in snd_usb_midi_port_info[]
> > have the format like "%s Synth", too, and those should be adjusted, as
> > well.
> >
> > Last but not least, after we get a final form, could you try to submit
> > a patch in the proper format as defined in
> >   Documentation/process/submitting-patches.rst?
> >
> >
> > thanks,
> >
> > Takashi
