Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A62919D89B
	for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 17:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745343144; cv=none; b=ogCzdAgHhD/dLwdOBfzQM2o0NlGNRtsQL5zpGZzuk3mRpS9BNsUU6/yw5IlEAWzSz4eERu1QoHU8WcPVmEVfTPrXvuMKLclrAyPrEH1ILh3+fZnRP3xhnOksYu2k2zEcdkm8tMDMaeIKk5Rg2gLd26xp0gG4shur95n3XL6GVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745343144; c=relaxed/simple;
	bh=Ry5Az6EB7mBr/KdEKWOZLMieodtIDhHk3AWDBS4lg04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sF80VTnNsyXWtGBxl1Jl0L3Cz00TYgZtqgC2EiQVZmaL9x7aR9R+oGl6cmxeiYoM+J7PDx1aEdLReMRuBOZXQ338K8VvCIlx7pAuawRZpy2xbqG+IjT3+jT56dgRE1GWEuUxbYjg7dvhAmpiZtK+PxK6uGO/G8k1d9to7JOT9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com; spf=pass smtp.mailfrom=linuxaudiosystems.com; dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b=VzFsO5St; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b="VzFsO5St"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c07cd527e4so528605285a.3
        for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxaudiosystems-com.20230601.gappssmtp.com; s=20230601; t=1745343141; x=1745947941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQRH4kcAFC3/SqQcuImzc27n0tC/m53OMRqRqFHlp4k=;
        b=VzFsO5StR5u7BFxvoBBzMmvmR2ljRmkIjIGYBXjZggDTgv0kfK3H4btZvU/7plpdRE
         TYbyXCX3qCJub+gUjka9/l8gQcGmlmV6Qj7rREWbL/GvKfbnvq24djJwbO+PN9yxrAe1
         A0CClVWAMvcaXqzrvL9Js+/iuY4OByL/3XD883aNiz27Mi96gfcFMPQ6VSsa+xoKS81h
         eJmWjLjQpxum0xiyzimI+OwwS2hg0o8FYVUPtmkKWcNB96Uq/KBeQs0pV3nlP2d3qEPs
         ieGN2FrmFmkU2Arh7to5MU+1nRZO8w+RoPHOZS2GR2Tjknky5n1u9JkJ2ml4iNFLd9XE
         5MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745343141; x=1745947941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQRH4kcAFC3/SqQcuImzc27n0tC/m53OMRqRqFHlp4k=;
        b=l/bf1Du2eHzNBYCqs47G18K2ESs6ZO+NQVu/OmTzmb0NZARJK8WBv7pBTDNVy1dvwE
         qfOedl2BMEhbbZB8sev+MugAAqM5xOpYdAgceNqwcXL+eOrQ6nS9343RsGstaqk4pq/g
         1vECdSq62+vRWqLAkOfFqxxzkxTlWUd39FQ412SZ8ZaNyctxei0N9S5xNqjI2kHYUg5/
         GI07HWy0x2SAeZmvffe1rVzxorXAumNkec1BYWd4fqoaGspIslGNOx5k5k8xfrLm0z4G
         HuMzM4gORvdg1An5LhkYE5bO9BQxLv6qltxmtQbNci7ApwuXpyqQcGYFCMUpn6lFfKJE
         gFqQ==
X-Gm-Message-State: AOJu0YzRI1BAeqxd2x/QmQ1bRFfgW1ShwrLZL2a+3X9vfBogbGyDWeiU
	kqyYrVgKSEMNzrczzNmxKKx1dD44PQu47XWu3yffOGZ1hz3xYYd6f5pErdKZstmsAjjeZbqT7P0
	+sJpK7tVxU1zQ7FsJ2WdNFebgdgBypis1bCSUaZVU0HVGP+qiUA==
X-Gm-Gg: ASbGncv8pBYPt1SRCa3BoPixjpiqUmV/SKfU/XkDlsnWgn4aStWxIIqG6XlEGZrgLiw
	RORbuOo8Cc5h3rx0hzV6nKj/kwWQNAfJfmSap8XvWQXsuyN4tPl1nxBaiVfgYGzPI9fTS94NGDk
	Y/RIS3sHr65YlK4Y6ei8mw/g==
X-Google-Smtp-Source: AGHT+IF49goFdUYl2yFPGnj5HDmOfh8uyZJ4t7BnVIUHsvIuPqkQ+sNumoAuz1fSwBrfnPxCNaAIncvGuiS/JCbXHqY=
X-Received: by 2002:a05:6902:480e:b0:e61:1339:31b with SMTP id
 3f1490d57ef6-e7297ea3602mr21337137276.31.1745343130416; Tue, 22 Apr 2025
 10:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
 <878qnss187.wl-tiwai@suse.de>
In-Reply-To: <878qnss187.wl-tiwai@suse.de>
From: Paul Davis <paul@linuxaudiosystems.com>
Date: Tue, 22 Apr 2025 11:31:59 -0600
X-Gm-Features: ATxdqUE99FBCrdEWFWx_3nTMSng_TObw5nmLKmwEgH6mm2bOrLOkkSC5g_-Mv5E
Message-ID: <CAFa_cKm3ded=1+3-i5BYjTa8JTeqZcGkGhakgQWfqPy_H=NBBg@mail.gmail.com>
Subject: Re: ALSA USB MIDI port names are poorly constructed and truncate
 iJACK names
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch was developed using the Debian 6.12.12 kernel source, but I
believe it works without changes for current git.

The approach taken is to always look for the iProduct name
(umidi->card->shortname) in the iJACK name (jack_name). If not found,
the code path is unchanged. If found, a different string format is
used to create the port name, using only the jack name. Note that
since finding the product name in the jack name implies the jack name
is not default_jack_name, there is never any reason to use "number" in
constructing the port name.

This generates the expected port names for several USB MIDI devices
here, some of which have "product name in jack name" and some which do
not:

% aplaymidi -l
 Port    Client name                      Port name
 14:0    Midi Through                     Midi Through Port-0
 16:0    Scarlett 18i20 USB               Scarlett 18i20 USB MIDI 1
 36:0    Keystation 88                    Keystation 88 MIDI 1
 40:0    Launchkey MK4 49                 Launchkey MK4 49 MIDI In
 40:1    Launchkey MK4 49                 Launchkey MK4 49 DAW In
 44:0    MidiSport 2x2                    MidiSport 2x2 MIDI 1
 44:1    MidiSport 2x2                    MidiSport 2x2 MIDI 2


Signed-off-by: Paul Davis <paul@linuxaudiosystems.com>

--- midi.c.orig    2025-04-22 11:20:30.192338737 -0600
+++ midi.c    2025-04-22 11:20:47.373155820 -0600
@@ -1817,10 +1817,18 @@ static void snd_usbmidi_init_substream(s
     }

     port_info =3D find_port_info(umidi, number);
-    name_format =3D port_info ? port_info->name :
-        (jack_name !=3D default_jack_name  ? "%s %s" : "%s %s %d");
-    snprintf(substream->name, sizeof(substream->name),
-         name_format, umidi->card->shortname, jack_name, number + 1);
+
+    if (strncmp (umidi->card->shortname, jack_name, strlen
(umidi->card->shortname)) !=3D 0) {
+        name_format =3D port_info ? port_info->name :
+            (jack_name !=3D default_jack_name  ? "%s %s" : "%s %s %d");
+        snprintf(substream->name, sizeof(substream->name),
+                 name_format, umidi->card->shortname, jack_name, number + =
1);
+    } else {
+        /* The manufacturer included the iProduct name in the jack
name, do not use both */
+        name_format =3D port_info ? port_info->name : "%s";
+        snprintf(substream->name, sizeof(substream->name),
name_format, jack_name);
+    }
+

     *rsubstream =3D substream;
 }


On Tue, Apr 22, 2025 at 8:46=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 22 Apr 2025 16:31:50 +0200,
> Paul Davis wrote:
> >
> > ALSA's USB MIDI support appears to construct MIDI port names by
> > concatenating the iProduct name and the iJACK name. The problem with
> > this is that there is a fixed length to the port name in ALSA, and for
> > an increasing number of devices, this behavior truncates critical
> > information from the end of the iJACK name.
> >
> > For example, culled from lsusb output:
> >
> > Bus 005 Device 098: ID 1235:0145 Focusrite-Novation Launchkey MK4 49
> >   iProduct                2 Launchkey MK4 49
> >     iConfiguration          4 Launchkey MK4 49
> >       iInterface              5 Launchkey MK4 49 MIDI
> >       iInterface              6 Launchkey MK4 49 MIDI Int
> >         iJack                   7 Launchkey MK4 49 MIDI In
> >         iJack                   8 Launchkey MK4 49 MIDI Out
> >         iJack                   9 Launchkey MK4 49 DAW In
> >
> > gives these port names:
> >
> > 44:0    Launchkey MK4 49                 Launchkey MK4 49 Launchkey MK4
> >  44:1    Launchkey MK4 49                 Launchkey MK4 49 Launchkey MK=
4
> >
> > which is useless since it fails to include the "DAW" and "MIDI Out"
> > parts of the iJACK names.
> >
> > The correct fix, I think is to only prepend the iProduct name if that
> > name is not present at the start of the iJACK name. This will cover
> > devices where the manufacturer does *not* include the device name in
> > the iJACK name, but will fix this situation for devices where they do
> > (Novation and Arturia and many others do this).
> >
> > If agreed, I can construct a patch for this.
>
> So you're suggesting to remove the substring matched with iProduct at
> copying from iJack name?  That'll make sense and go ahead.
>
>
> thanks,
>
> Takashi
