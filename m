Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480428;
	b=I0ZF5Erogq0P8B4RRxMF+2QHccjXpGJYE9qUt5NYcHgVEHk8tA5dgPSczJf/8OYvWRBj
	 AM4GoIQY8dapJ1RU1b5PddfogOYvgL0B8323DIgoHbEC0uvKmreQ0RdIB2doKcFeNvAel
	 4iao+MDRQUw9Jl84C8cV5bZTYGHgg0XS/IbTNDqfGBa74zJnGRzg0CI/DQKtMNM1VYMCV
	 8Ww0obEvl1bXj5dAfR9SWYo5bnTeHct0E22BI/Y+qVz1fsNylx9x0R1/BxU5P6/Qfq0du
	 Bg8rT47b5ui0Bir+uup/fhtlBDQ+AZDIMJTq4spBArn+LPYdIHCP2FiS4WXdzJPG5EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=+x35hJC9iAKh38HQyYExCY0t7+dxHLSmOa4XLkkrNso=;
	b=WTnZFRA7ej5uI4/eCxXPr9RJWKSw4785y6t4v35hDI2bL/eiEOs31HAFRdKwI2JVueSV
	 R6Y7xGxqBTobIpeLaxd4c9lt17vmFDR4YZ9+mp4Qk7gpQbc7EUk3jhFqVB13Hu3jG5xal
	 HqIZMf91PQUZEcAr+bbATMvQCVap0xjS6RB/6WhBwgduiR/8VXgZ4Upd0yfkU9ipbs+3F
	 /rQ8Jwck7QZGkgeHpfXGvk8Cz9LkfETHTlnOfKmk5XD7s6kvebF33/L1chbAjsMzilwwq
	 dyVduo25x/JfeDZ9u1WaVwVyue4sUQsD4GcYRvhNoOC1xPrfiMwP847fsh0EYFc1Sgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2Ve8Jtv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A5606A886
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5A5606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2Ve8Jtv
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso792654d50.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794480427; cv=none;
        d=google.com; s=arc-20260327;
        b=L4tq7tSIOT7IKjS4wZwEpJXI3NXqyZyAlPj4i9ULbW3HPExgPO2cplkB7teN3WMTf8
         bKmdUjB4RyN4hItBJjMd6h3yxxegMH3BOCrK8XV755tr+rIDrWXYD7PJwbNi4jnVMxPC
         aM0abhlKUIux6nQxv4omQ8/jes1MYleJ85QnH+zELF4aQJBBLXYQa7hMekAvdN5vU23E
         5Kd17KY7L0AbwQaMZZqW2ztluTeZa4lvuQvpoYdSF2D5oF6Cd+BVISYPSN1F+6IcrEsA
         ZlKI0qcbP+tAaHvCIULm9DZHKQwH8Ag6DpzLVc5TgKwUDj1h28gXSaRvJHDYcnAOD1nM
         0WUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+x35hJC9iAKh38HQyYExCY0t7+dxHLSmOa4XLkkrNso=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=cOmIlQhGK+0ThiEY0ltJW584dk486HbgL/SJ0fynWOBodmnVlcD+NsloUp2ooCfv/G
         FMAxYNjWOMPhaqHS2dwqs51FTSpm6W/5rewZtPyPuIqVTR4SVlHIRIP57VPGnFh+4bCg
         hzhSvN/92yyKaMYeEoePQ8S1xpxGimn0W9Nj02uo5gHjvgnn0apb3koBoqVY5qtqgZLn
         tvk9EyRCQbsmPiBJEf60QyZMJZrPPM9D5bWz6uj+PV481WFch5nt9eZCHU8Qg0IetZoR
         ANQPdCE0j9HHUNTKNyjC764Fb19cs1ollFORCSu77KnkOs4FiJ2ch/nAqDj6e3TUU1+L
         U1+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480427; x=1795085227; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+x35hJC9iAKh38HQyYExCY0t7+dxHLSmOa4XLkkrNso=;
        b=R2Ve8JtvWYN7K7BPOWiZ7FSnL/IHpk9OK9BtiqHnXhYoOMFdJKFCVbiCDiWDATDXds
         M37mBIX6kXhwcr7uYqLeXr6f+jT2E2QU5WKDoAtyurGaiN9yfPaHifUta9dvKH+WEuhn
         mqr3dzi0B4Vxmc/hCDWZwyJUGPTJvyCdTSnEhzzZbNUbLyloaVhRS3wYGKIJHGv5sV2/
         yBSVPblPrg1t/1zEAUZF0WZLFCofW6N2/jVN/Vu4T7TZVGg8qSSBykt76jK9k9Zorxfi
         y1ZvbF5wdSrowePIVzAAmiLwL+OumDBWKz0jWl9cx/tGocxKDTPUQp88Xivow79tkRMS
         IlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480427; x=1795085227;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+x35hJC9iAKh38HQyYExCY0t7+dxHLSmOa4XLkkrNso=;
        b=HmsyS91L1RXbZHRxBRNf2QujDxp4GslyMP3+yzqfT31iKLAD9Rwrc5dUJHdpCvG5x4
         fQz7ntzrjhZofYN6UVtUGNq8Zv/ahiu6t6iBNCJF9zAt54Gd9whcVaBY57nmsJP1xvCJ
         goM5wtheVUmN/4QlpX98hD1udgJN89gkc27eatOHRZNKI0vYW4YmP+oeXdAyOlxJa3r7
         gSTel6VjidosjJoKe9fKysTw23fP1VbQZBGEKdm40OX9XMZ1sIZ/JXaKTdeqyp4l6p/s
         2tG0+EesEzQ21yanZjGac2ckNtG5aRUtTnXTGsZybihdoQsUrlQPsZA/5rQDud87l+/N
         i1tA==
X-Gm-Message-State: APuU4Z8kBf/y2g7Qb11gRJLi/zAPAthm5Cm8hrgMblKrSsxZcuMvNJG1
	+13XGygxZbCWWJYqddC15OR/qtqHJ0GYJ+RNHbYdf6xxNEtB8xt5qaWh4zKh9UmrMuZWPQczv38
	5gpLEG63+Xeksxfh4qcJOOnies5DF5G8Oyd+7w1XTug==
X-Gm-Gg: AYBFou0wXV7jFOCXgws2P3/+E/PNFA5/wYUkn1y19GmiOAW1UsUAI6RsK9od+CXTZKD
	SYqcW5lQbo7SvTjSX7lEI+HcEeTH0YpCIKgBl2i/hj89gW96+vEq3vz92RYU9219ldb9QS2AWQ+
	BNCplGJK5KfFrDIBaZHV0KcmTU9Tnf0qpYz84cb7Qr0sxtB47aNIBpWT3uPZyxcCZ8oi6vyXQMr
	jEK8+KyoXvX314KvIyp+qZURWVdaFfGsvpYyWu2ziS4+j1s5RN9otwM5/yQdlb0EzihsLvbMTGS
	0ykWo92c+x+ZHGIJcLovOqDKfPhJffxUEZDEqrLDHoZMjnoScUGqLBq6dqJz5kGcD4VQEvAx7RQ
	g7+YzKaenD5s/DaQZKdO1XoCAqIDY00zy3q9uut8ojaAh9INB6TT/x2JzsPY=
X-Received: by 2002:a05:690e:bcb:b0:67a:86d7:b9ae with SMTP id
 956f58d0204a3-67c791b38d2mr1456375d50.42.1794480427332; Thu, 12 Nov 2026
 02:47:07 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: London grad <londongrad@gmail.com>
Date: Thu, 12 Nov 2026 10:46:55 +0000
X-Gm-Features: AclHuK81co7uHEcYghgkR9s_W2L36pkqqT9r8lCwr9GzDgVx1Zrltl0UsN7GI9c
Message-ID: <CANd6TdLsz3M-cWsbQtRSS6NQOt=YrDEEfv64h7A_Og9Gdb0EvA@mail.gmail.com>
Subject: Regression: ALSA: ua101 breaks genuine Edirol UA-1000 ("playback
 packet size 560 too small for 15 capture frames")
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm seeing an issue w. kernel 6.8.0-149 and ua101, it's failing to
initialise, possibly because of this or a related commit

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=86f86e6fdedc33c5b8d38b9208b350f8accf57ee

Bugzilla ticket:
https://bugzilla.kernel.org/show_bug.cgi?id=222261

Here's the report

Regression: ALSA: ua101 breaks genuine Edirol UA-1000 ("playback
packet size 560 too small for 15 capture frames")

### Summary of Regression
After a recent kernel update on Linux Mint (Ubuntu kernel base), my
genuine Edirol UA-1000 USB audio interface (0582:0044) stopped being
registered by ALSA.

The `snd-ua101` driver aborts probe initialisation with:
`playback packet size 560 too small for 15 capture frames`

This appears to be a regression caused by commit `86f86e6fdedc`
("ALSA: ua101: reject mismatched capture/playback packet sizes"),
which incorrectly assumed genuine UA-101/UA-1000 hardware declares
proportional packet sizes across all endpoints.

### Hardware & Environment Details
* **Device:** Roland / EDIROL UA-1000
* **USB ID:** `0582:0044` (`bcdDevice 1.07`)
* **Distribution:** Linux Mint (Ubuntu-based)
* **Last Working Kernel:** [6.8.0-146-lowlatency]
* **Broken Kernel:** [6.8.0-149-lowlatency]

### Steps to Reproduce
1. Boot into the updated kernel with a genuine Edirol UA-1000
connected via USB 2.0/3.0.
2. Check `/proc/asound/cards` and `dmesg`.
3. Power-cycle or switch the hardware sample rate selector on the
UA-1000 across all supported rates (44.1 kHz, 48 kHz, 88.2 kHz, and 96
kHz).

### Expected Result
`snd-ua101` binds to `0582:0044` and registers the `UA1000` sound card
in `/proc/asound/cards`, as it did in previous kernels.

### Actual Result
`snd-ua101` rejects the device during probe at every physical sample
rate setting (44.1, 48, 88.2, and 96 kHz), leaving the interface
unregistered in ALSA.

### Relevant `dmesg` Output
[ 2622.796887] usb 3-3: new high-speed USB device number 5 using xhci_hcd
[ 2622.928793] usb 3-3: New USB device found, idVendor=0582,
idProduct=0044, bcdDevice= 1.07
[ 2622.928798] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 2622.928800] usb 3-3: Product: UA-1000
[ 2622.928801] usb 3-3: Manufacturer: EDIROL
[ 2622.928802] usb 3-3: SerialNumber: ZT02743
[ 2622.934792] usb 3-3: playback packet size 560 too small for 15 capture frames


### USB Descriptors (`lsusb -v -d 0582:0044`)
sudo lsusb -v -d 0582:0044

Bus 003 Device 010: ID 0582:0044 Roland Corp. EDIROL UA-1000
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol       255
  bMaxPacketSize0        64
  idVendor           0x0582 Roland Corp.
  idProduct          0x0044 EDIROL UA-1000
  bcdDevice            1.07
  iManufacturer           1 EDIROL
  iProduct                2 UA-1000
  iSerial                 3 ZT02743
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00bd
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      1
      iInterface              0
      ** UNRECOGNIZED:  0b 24 01 00 01 35 00 03 00 01 02
      ** UNRECOGNIZED:  0c 24 02 01 01 01 00 0a 00 00 00 00
      ** UNRECOGNIZED:  0c 24 02 02 03 06 00 0c 00 00 00 00
      ** UNRECOGNIZED:  09 24 03 03 01 01 00 02 00
      ** UNRECOGNIZED:  09 24 03 04 03 06 00 01 00
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
      ** UNRECOGNIZED:  0b 24 02 01 0c 04 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x02d0  1x 720 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
      ** UNRECOGNIZED:  0b 24 02 01 0a 04 18 01 80 bb 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0230  1x 560 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      3
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      3
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol       255
  bMaxPacketSize0         8
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)
