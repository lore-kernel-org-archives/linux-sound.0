Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAB1282F1
	for <linux-sound@vger.kernel.org>; Sun, 30 Jun 2024 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719763492; cv=none; b=HxkjuL8Me5UEpLQK4pp2CWqIlCE4KANKGhk0/HM5MyNeYu+u20jglPV5Tq5h9c6//C/RucPqBQNoNJKTaGoJWaHaSZyYz771ImO4mt+xjIkQej2KzyVQ3A/0EfwGQiQMMRoULcs5ChJTSrS9l7K3RNhW2ma69uIdupcz9g8zi5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719763492; c=relaxed/simple;
	bh=GX5Otp5utvZGGs/kBsIHZhr8eaLpHC8CGzKUfMMXM5g=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=XLQ7mEXaDdMtc7N7LCTGXCJ+CxRyDzg9RthUSjJ1fy4ACQ1GH4XS+8Ns7u3i1oUagdgXxlltg27gKMRJAVob2/ufl38TAlY5VnR4EgLKhb6pwtkBtbGR8Ya2TleN3wPxf2vvodl/4p08b/ndstcsK2EC/0S5r+ZMe9y1QZvJP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=zM4sM+Bz; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="zM4sM+Bz"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D02594267F;
	Sun, 30 Jun 2024 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1719763486;
	bh=GX5Otp5utvZGGs/kBsIHZhr8eaLpHC8CGzKUfMMXM5g=;
	h=Date:From:To:Cc:Subject;
	b=zM4sM+BzNTaLA/4AarFvz2lVndLzN/xefCkuJILq7ZkoqMIiGrIRFxr373U61Tg7G
	 V18+/IrM9nSMRcSQnRdN058nLgeH3x2M6409+VYfuTJReeD32q/FGLSN0QVbVoN6kp
	 fdBf+vzfE/b8JbfiSeTnfRs1i64wSgxibLFmqM6jlKY59Vq3t5SYBrsGINmlEsQbv9
	 ljcuDEv90dph6+uZn0tZP2qbv0zfRqPabP9Y7JC6sG6haD24P/hrmPFSiXsLMP007U
	 4X3BYmXrtYgI0Zd2Z6z9f6Mn1HIEUS418Qu2enpiruhJOxHwQjnj74EfpHzoBim65i
	 KWXBpeNsADRKw==
Message-ID: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Date: Mon, 1 Jul 2024 01:04:41 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Handling complex matrix mixers in ALSA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm reverse engineering and implementing support for the RME Digiface
USB, which is an ADAT interface with a non-class-compliant interface
(probably similar to other RME interfaces like the MADIface, but I don't
have any others to test). The basic audio streaming works fine with an
entry in quirks-table.h and a format quirk to set the system sample rate
in quirks.c. Now I need to figure out how to implement the mixer controls.

Currently I have the snd-usb-audio driver claiming only interface #0
(streaming) and I use a Python script to control the mixer/settings
directly with libusb (control transfers and interface #1). This works
fine and there's some prior art for this in the firewire world (for
example, snd-dice doesn't do any mixer control stuff and you have to use
ffado-mixer to control everything from userspace) but I assume it's not
really the best way to go?

The problem is that the device has a 66x34 matrix mixer, with up to 2048
cross points enabled at once. Exposing each cross point as an ALSA mixer
control (similar to how mixer_scarlett2.c does it) would mean 2244
controls just for the mixer... which seems like a bit too much.

On top of that there is also VU meter feedback for all the
inputs/outputs, as well as general fader controls for each output and
global output configs and status. I'm not sure about the VU meters, but
everything else sounds like it would map fine to normal mixer controls.

Is there some recommended way to expose this kind of matrix mixer
interface to userspace? I think for something like this you pretty much
have to rely on device-specific tools to make the UX manageable, so
maybe hwdep... but at least exposing everything as an ALSA control would
have the advantage of supporting save/restore with something like
alsactl. So I don't really know what's the way to go here.

System settings/general status/output faders go via control transfers,
while interface #1 has an interrupt IN endpoint (streaming state
feedback, not very useful) and two bulk endpoints (matrix mixer control
out, VU meter data in). There's another pair of bulk endpoints in
interface #2 which I'm guessing are for firmware updates (I haven't
looked at that part). So in principle it's not crazy to expose all the
system controls/output faders as mixer controls in ALSA and leave
interface #1 entirely unclaimed so a userspace program can directly
configure the matrix mixer and access VU meter levels. There is a global
mixer enable bit (controlled via ctl transfer), so if that is exposed as
an ALSA control and disabled by default the interface will operate as a
1:1 in/out interface without needing any custom userspace to configure
the mixer.

There's one other quirky thing: it also needs a way to set the sample
rate as a mixer control, because you need to be able to configure the
rate even when the PCM device is not open (since that affects
stand-alone mixer operation). I imagine the right logic here would be to
have a selector control for the system sample rate, and automatically
change it and lock it when the PCM is opened with a given rate?

Any thoughts welcome ^^

~~ Lina
