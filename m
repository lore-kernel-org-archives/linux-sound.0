Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555781;
	b=VfgNKykVgiYLOjCKE0tjNfOswuBHJxJ/P1gzIt02SJ9VIIDB4zN57FSMfj7udOHciCeg
	 BKA8fyr+ltuEruQoKRByO97BuSh0ma31OPd8pwym0kqqUUjQQFGaYYhOmtUjtCtzAJ3Y9
	 RwcgkdiElY+1Pf+lbX4A5JF32CuRItMd/Dlek3L0/lj3kAhP5htdsWjRyB14nLMYmbEKR
	 iapqwBWGRyt9ZN8RhlsbAd7Jj9sbjMlluLKzFhqfCs2n6fnQWRmmUIm/XtTiHynA8Uvut
	 BBCLVeCiRPgQOqbtBZ39nQogCJqaXethZOCjZ28rwXDJq4pg4PAiz2YUyBbyMO2jPBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555781;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rplzt9pHBZ7KI7YF6AaTcYWeKp5zCIVQ5PfkuKZKNf8=;
	b=FOUQ7dn2Kk1tpcU/sxsknJ9JrjiPKBpr/XlqbKjCh/WPxDOPDLe+viGkrtrPr027ax9W
	 24qDElQFCSdu2KHyo5TZ0iQsbFPmkv4ekhza2sNAIaBYh96ZEyLK1X3bvul2JMpEJTPLv
	 wVxTZQkTaTJ5vzm83vlAN6gCWpR02ApRQs3sUTbk4ZONRb0H96yJaIvdQXGJxzpGrUrgc
	 BDFZVzHLoC8ykkSx4wSR75FXBHY6OW6bkDfjanlLciWbXJ7AqFiLbYdoqtHtafcR8I02K
	 ve0VdPyOs8gf5cnq+1GTNNztmui+dy9BT3Ozv2xQDCbfmIYrJDeZcuXcCUKrpUd7h9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kert.fi;
	spf=pass smtp.mailfrom=kert.fi;
	dkim=pass header.d=kert.fi header.i=@kert.fi header.a=rsa-sha256 header.s=protonmail3 header.b=RhjlqpLe;
	arc=none smtp.remote-ip=79.135.106.26
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC6606A325
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kert.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kert.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kert.fi header.i=@kert.fi header.a=rsa-sha256 header.s=protonmail3 header.b=RhjlqpLe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kert.fi;
	s=protonmail3; t=1793555777; x=1793814977;
	bh=rplzt9pHBZ7KI7YF6AaTcYWeKp5zCIVQ5PfkuKZKNf8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RhjlqpLeNjQMvmafKk4DC8YiqsvSx0A5Qtzi0/Z3pSPyMg8oUnvi1MoyHa46ARVFz
	 TthzYviojzodldR1LIYf7ypp5+9eSizoKoW0p5kmSBFhFQBRh0PWGogEMOodutDPy5
	 ct/N4pieuyij+isJ8ZXLr/PJKLVxQmIPyVArARfDYhURhKTJKC71oY+jxc9RnEDKc1
	 D7EDI6QRaqS9FfB0k75J0DPiz8GA/e9l3wbjg7fjO9fUbuHUY1TQ2EqNKVXvxmEKlf
	 E9SFB7EgoVRKEVMSiGLdLN7cZTR/ugv8dipQ26xhFv+vHWz41YjtPio+Yj4bPzSPeS
	 DkPr8UcDJjGcA==
Date: Sun, 01 Nov 2026 17:56:12 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: Ile <ile@kert.fi>
Cc: "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: snd-usb-audio: Jieli 2e50:0040 (beyerdynamic MMX 130 wireless dongle) ignores feature unit playback volume
Message-ID: <xRUVDUVuK9LVB2wWcnxtnFiuP91oJSo85hiEw0q0tMhNRwiT8lSFXjqrjAGts3vuuIZaZNOm-kBTAuLBM6bY3L2CvIUtEECKpJsPwFNQOMw=@kert.fi>
In-Reply-To: <VAHRtk3a46g7zeZ3Bq-mAopkeaTLPklqHvaG8rdJgdjtGAfUQJD37X8V_a9VJHvfhDDxSnz2v-etlrE20nAvZvF4X8faiTnWbDyCq0sePHg=@kert.fi>
References: <VAHRtk3a46g7zeZ3Bq-mAopkeaTLPklqHvaG8rdJgdjtGAfUQJD37X8V_a9VJHvfhDDxSnz2v-etlrE20nAvZvF4X8faiTnWbDyCq0sePHg=@kert.fi>
Feedback-ID: 49247821:user:proton
X-Pm-Message-ID: 002effafe69eb4afd8f8d88ab091ca52637b784e
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

A follow-up with new findings.

After a system suspend/resume, the playback volume control on this
device starts working:

- Right after resume, output matches the restored mixer value. When
  suspended with PCM at 80, sound works immediately after resume and
  PCM stays at 80. When suspended with PCM at 0, output is silent
  after resume until a new value is written.
- From then on, 'PCM Playback Volume' 0..147 audibly changes loudness
  as expected (verified with amixer while playing).
- At raw value 0 the output is silent, so the reported -28.37 dB
  minimum looks wrong; the hardware minimum appears to be effectively
  mute.
- Because of the wrong dB range, PipeWire maps raw 0 to roughly 35%
  sink volume. Everything below 35% is silent, and the usable range
  is squeezed into 35-100%.
- With real hardware attenuation, the headset's gating/pumping on
  quiet content disappears.

After unplugging and replugging the dongle, the control is ignored
again, exactly as in my original report.

The dongle stays powered during suspend (its LED stays lit), but the
host controller loses its state, so on resume the dongle gets a USB
reset and goes through reset_resume. dmesg on resume:

  usb usb1: root hub lost power or was reset
  usb 1-1: WARN: invalid context state for evaluate context command.
  usb 1-1: reset full-speed USB device number 28 using xhci_hcd
  usbhid 1-1:1.3: reset_resume error -1

After resume the HID interface no longer reports any button presses
to the host (volume and play/pause both stop working); the volume
buttons then adjust the headset's volume locally, while host volume
changes still take effect. So the firmware appears to switch between
a "host-synced" mode (HID volume keys, feature unit volume ignored)
after enumeration, and a standalone mode (feature unit volume
honoured) after the failed reset_resume.

Unbinding usbhid from interface 3 on a freshly plugged dongle does not
make the volume control work, so it is not simply the host HID driver
being active.

A USB reset of the running dongle (usbreset 2e50:0040, which I believe
re-probes snd-usb-audio) does not help either; the control stays
ignored. Only the suspend/resume path, which restores the mixer without
re-probing, gets it into the working state.

Could something in the initial enumeration or probe sequence (HID
setup requests, or mixer probing writing test values) put the firmware
in the mode where it ignores SET_CUR? The silent minimum might also
call for QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE or a corrected dB range.

I'm happy to test patches or collect usbmon captures of the plug-in
and resume sequences.

Thanks,
Ile
