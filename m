Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192062116F4
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775468972; cv=pass; b=XvWFzTCUjuHhCfK/PJ+pNjNtcjiKwGUkFaCpfXdLV4Owwr9iG3iQQXyGlz1rrgoZubUVnYhb5Mq6VGM01QeN6e+VYdel/gcgH9Yut/C6BvqM7z/344Nd3TA3qq3CtVKXgwAr0aN92wagAwERzKKHRomPxJeJkaiXTQQ1aXgOH9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775468972; c=relaxed/simple;
	bh=FU781uB4qwcwSild1J+5IFx83WD0PlzoW+JfZ9hR3Vs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jqG9rmu61eLp3RvgXtZbWcBtLGd8M9anl4Fg+dYGQl/j9YboKOaSftiqFERlMVvuRWIoHiJVIltGQUIr/KokmwX7Rd6ONRzu1k7Zd26rzu9dKlDoAs9BfokPzEVahgwSJ/qvlAxAg1S4zn+ZtVST6uVtT8GGyQrPR7lm+dZC8i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrpekTI9; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrpekTI9"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfc085395fso334498085a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 02:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775468970; cv=none;
        d=google.com; s=arc-20240605;
        b=P66V4erjrarOs2X0HaonUVJu7bcYaydXG4aDHikfieIA+Jqah6OUSj4CLx9LdPi5La
         w/ERqD4rvgwKyUu45jhWXVPY9CJ1KC82wFLyXnGPMv7Ce7xosorrE/aeh1q1zY53DKFf
         PHjCemPNNcmn+ljkBwSKiqgZBUAyW+RWX4Ruv04yPUuq5LXtXMn84d6btvxFJJXCrraI
         XNsyRqAGaDnDmY7E8UdA+BOK17K/BWSZ0gj3+AbgHhdd0Do8EjUMgdceMrU/dd9kdPMz
         pqO7KoTcxInxeSGEb5G0PJqo33XSULuAYpgYHTEbIea7OU50mcm7mrALX22BJijQnP33
         e02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HZ6FrWIG+FWAuBiEHC1AEeQGJS/m9+v9ZeE0gXDJWAo=;
        fh=kAdPqilKDy89/cGNobEXoxGONuFQ+oggHERCsrNZiUY=;
        b=iTHRy9KRf5YfrxXbdsOH2IvSozJj4QO2ZiDEETtBKCEruF+PemaxSqMD/FBCDLnDRt
         sOkgwvWC05tKDghZ8ASqTXBRnrZ0GvrVpaqUFFVoADDqhgn4abONzUb3AU3g7mZCNgnO
         ++O7kggqurK5a+RI94E2VswN0qGE8ITRE3zCoQCtBfzePp9Nmb817o2PA48rEpxzu3cI
         xYSmJcDeAxuLABT+mLz8FXX+wVpqT5uwvLICMGcPpu8SxPfvQM/DmZyDgbCS+ZmNiOpy
         kAMpdRaLKdzUFD2ssII0saHWt6kn5EbPyJnle3pJ4PQC3CxV0jLJudHQb/A2mt0D/CvO
         4lRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775468970; x=1776073770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HZ6FrWIG+FWAuBiEHC1AEeQGJS/m9+v9ZeE0gXDJWAo=;
        b=HrpekTI96jmu8G+qNWaD8omZH2AhjTPaNB8itqQD1l/UQmOAipIJzIF5wtZoQkXegG
         JM0/iZ6KVzY0djRJKeEM6+0d25Naw1+Drwc27XPzmdeg9w112XvY0KjwN278t47lDksO
         /b1VQKuxQFP9PtkDmnQz/a/7RZP2Wody6H0Ve3VacwpJGj/8WQ7rnQfW5sUhvSa6t/nX
         kbIJOwu+6wdPqkCJYAyHi0bpnf0qcOSxEX2iggEWfKXrEh4omrs2JP/9WARGjpjyZfae
         TFGzMy4O7tSi+On8os/Z7njFTHQEXsuxmmyjscUyRs/mhWgNLquqLt0Gw1EPKzPSV+sw
         pj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775468970; x=1776073770;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZ6FrWIG+FWAuBiEHC1AEeQGJS/m9+v9ZeE0gXDJWAo=;
        b=MYnJESyKolZv33fKebkbTJeYz/uzMj7iloBJzcTdspRuOYwC/+knGNLtmEerlx0Wr/
         +sPo+ZRsrWAo1z3dM6z2g8tEEipg+YOykInJ4ildyakdBAT2NyxjaXjKg2zZDHEXpvw6
         XxfOeleBbBpUFVuXe4lPBfzbhL4N/8MMWLANbuRJNejgqLCCb67K+u1bjAM75181Tql/
         /o3rfunls9mvHpbOWgAzrNLV8HNgBH+z3fNj8u/Ymzowy436GC2Vu9JUG1WGRj6P/bJR
         mvlJK0Je99WiO5KwwFxjayl6WmVO5vDDpFSAjKGxXkM2gstKxHGE2dD3CChRxiEkp0O/
         fxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcXM/GhfcBPOSnBGQ1xQKxIBAoosE6buhqBZpl4qfdWQVGlC2bMZ2fPve98DHX60MjQ1RzkjrRCp1GDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0UCf+109hd/g5cJQ3bxHdFElJo+zSBqGK35Mwc3wqUaftPKww
	VjVZj4FTDSiN+4K8aBgr92UuQ6STzQuwrkUjTpfooW9suyukCdMpxw/GKiMIp2oIPP6btuBFYJ+
	lA0iumMOrvOaRKmUfcTth9fXCAogG54g=
X-Gm-Gg: AeBDieuMNSa/YeTKJVi7wBPniO3Ro0rMRFBMxPLqy9yb25OLvNV3MQay/d9X5mygujz
	ErjaTdYxu6wwnnx3mvQig+udCHKEV7CIrpLt7IqoZLKp4S6uwbky1e9QYn69HNuU/cLbe+j2uYN
	ghZKMQtuudwSciEDJNy2xKGlhCgFchZeODlQjZ11DNAootxXcwZLf9QMVJPBEc3qhLbVVZMDlj5
	u6T6YrnVVUwm4E/2Qe0o2CXYfOGKjhEtO3eEMnCrKOSGr5ho5r1D17F9gyvi+vaccCb5VjdftNU
	PynV/oKz6eGXzpI=
X-Received: by 2002:a05:6214:2588:b0:8a7:14a7:fd48 with SMTP id
 6a1803df08f44-8a714a7fe5dmr185988276d6.25.1775468969955; Mon, 06 Apr 2026
 02:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marcin Krycki <m.krycki@gmail.com>
Date: Mon, 6 Apr 2026 10:49:19 +0100
X-Gm-Features: AQROBzDb7ihtDgFMbxpZI750fF111sTBPallQKucGmLatAz9QuY6nNZh_va8Wmg
Message-ID: <CAEfRphPAf6+HULwPSyTR020Hy6e7BO8=Cp3SS2S4oeYXwWJYWw@mail.gmail.com>
Subject: [BUG] ALSA: hda/realtek: SSID 1458:a194 is shared by different
 Gigabyte ALC897 front-panel layouts
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Cc: tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hi,

I found an issue with the recent ALC897 quirk for subsystem ID 1458:a194:

  SND_PCI_QUIRK(0x1458, 0xa194, "H610M H V2 DDR4",
                ALC897_FIXUP_H610M_HP_PIN)

My system:
- Board: Gigabyte B550 GAMING X V2
- Codec: Realtek ALC897
- Subsystem ID: 1458:a194

So my board uses the same subsystem ID as the one matched by the quirk above.

On my board this quirk is incorrect:
it forces pin 0x19 to HP out, but on this board 0x19 is the front microphone
pin and headphones are connected to 0x1b.

With the quirk applied:
- front microphone is detected as headphone
- front microphone does not work
- plugging only the microphone mutes speakers as if headphones were present

After removing the quirk match for 1458:a194, front panel behavior is correct:
- mic only: works
- hp only: works
- mic + hp: works
- mic only with hp unplugged: speakers remain active

This suggests that subsystem ID 1458:a194 is shared by at least two different
Gigabyte boards with different front-panel ALC897 layouts, so matching this
quirk only by SSID is too broad.

I am not sending a patch because the quirk may still be correct for the H610M
board it was added for. But the current SSID-based match causes regression on
Gigabyte B550 GAMING X V2.

Relevant codec dump:

=== Node 0x19 ===
Node 0x19 [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
  Control: name="Front Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x01 0x01]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0000373e: IN OUT HP Detect Trigger
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x02a19040: [Jack] Mic at Ext Front
    Conn = 1/8, Color = Pink
    DefAssociation = 0x4, Sequence = 0x0
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=03, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 5
     0x0c* 0x0d 0x0e 0x0f 0x26

=== Node 0x1b ===
Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
  Control: name="Headphone Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0001373e: IN OUT HP EAPD Detect Trigger
    Vref caps: HIZ 50 GRD 80 100
  EAPD 0x2: EAPD
  Pin Default 0x02214020: [Jack] HP Out at Ext Front
    Conn = 1/8, Color = Green
    DefAssociation = 0x2, Sequence = 0x0
  Pin-ctls: 0xc0: OUT HP VREF_HIZ
  Unsolicited: tag=01, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 5
     0x0c 0x0d 0x0e 0x0f* 0x26

Regards,
Marcin Krycki
m.krycki@gmail.com
