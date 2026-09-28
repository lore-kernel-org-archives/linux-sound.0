Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217383264CE
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582210; cv=pass; b=JvkszZdy+lHoZQXgr/OXaN10/+mV+L8dTbubVHFQa9mUzGE14nOVvBqg7iKT7IjbGBa/Ys/7jdMkXRVbRBWDFe7bC2E81tQ7Ca+0FaNvfKUpBzMDZZOVzhPy0sQ/0PO6VNL6P+cmUTWA7U8slwd7n0B0Z59LTg9z0PlH+iSWGBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582210; c=relaxed/simple;
	bh=8rqPjhookIynokSc5wHqVU1CjBEmw1gLORh6TxGsPTs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pTDfMHC+EJUIktESux4g46nrptttEmGiH9kFnETSDsW9GeSoKy9+Y1iPgMSFFMNiDcmrG7tuATO6ID75S/zQykFtF0lzJ4LL5sEjsJW8fzeg4+YoDCCJcmhiFPIAV/bacRti+BXfUom96AKmtkMwc2xLCyzWoUPr+cVSssmIg3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqmrjjAE; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqmrjjAE"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-67409747ac3so2086794d50.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 00:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582208; cv=none;
        d=google.com; s=arc-20260327;
        b=ojKZkmNhU/MLgJSTJN849AG3Hmzo4QyyCHg4D/rDAXPiOJEj7NYokzpaAbk0smdkVg
         VdQtu6eYXb1TSgpXKzhRopToeyv7IcsdYRspCuZmQUFAHpAY9Qaefj6c+NyTb3HPnpVp
         VqyucsLqPPJ9iJ9goyeG+OzEiOhI0R+smG872Kar6+hZLPCHFUTcPBeOneN9CVlfLYKd
         xrZ0gCVUnylOjSBE6CGLHfdhBi6GO6RZ+0Ce44CwHd9FYZtDaUpqw9FUahk1j4wRnOuz
         TUW0J7WjOaIGIPpJvfS5xG9mNfNgcTYwe4mSbf9HPzTG6+jb+V7kvQl3zQzUCQinMnon
         /8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EziSonndXBXteTd13qET7vi/qnjRURc178Jv95JdA0U=;
        fh=as0RKDD+fiaXY4YDNdBk6vOP3zUZaQ8btkrhg7iUBLs=;
        b=fstMbKmUou39Q9Enzq1AquV/d/BAvl7bH1Rv4nok+tAgNQJve3HPHg4B8u9Sj1GCvt
         57hPt3F0UHDENnnjmopvUoD/z17zscbYVoDpt0Lr3z6bje7/7nIp0xvL4tquJ69FH6X4
         YOOX33BvP6THcMOEzXKuIqllrCfHVxq4cX0QmURJYrhdG7hqvi04jil8DLSj0wLkOL5W
         ySeFYTn0701pO4QTyrpk/QFPNmGdNX5zkGCbBfAyJn0Ig2ZZZA7wVbKiGllP1mQrvm+x
         kmX4VeLeIoSz2JdUtiC8CiIWS41UUfLOZ4Fe4CaKwwwLk5pgMOUbAhXluVfQUf3zs9HD
         kjfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790582208; x=1791187008; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EziSonndXBXteTd13qET7vi/qnjRURc178Jv95JdA0U=;
        b=nqmrjjAEjOYhZjrPFiwjQC14CxLUuUGwvT8lsxqDitrYX8dm/KJa95XCOlttQf4ocQ
         WPxWRKjKIe0wV5tJecgYFz/FtWVoszjqf8y4Y08Gl5n0u1z5Jo/HgQEd90sMcwqZhsZw
         m/frDHpK4QJobkIa0lUUL5OaesaSwZHbuAf/Uq6Gf9304FUAFE0Bf3AShSwUEQ1SJAi2
         5dZuFIBzDOJtsg4aw8NrUd6f+beOG9eyZjMIM8q0ltUbodqUPHEbBbFqhpvybsbXazEB
         Xuq4qEyKoDuI2mSBOgfcXxw+A81XF4lzjAMlHLkr/INbArmO7VYwzZhVWrE9lflGjgnW
         FPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582208; x=1791187008;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EziSonndXBXteTd13qET7vi/qnjRURc178Jv95JdA0U=;
        b=Dte3MkvBBrMVryPt/XZisqPy805w/lUWI5Os4Q+uwgG1ugp2hm5FLsFMmQvMHQDuOM
         h9RN7TGS5w1qMZA/1FVNqLcDBT2raGCMmYlavK9zC1BU6+umn5JrcOWpJX+09MyBADXV
         GFlNcwpl+mO9uEAJvC3D1B3e2mQLddU5VMG5/d/v4mUYjV5/Uf+36U7FZgj6HjEXNPp2
         yI1uhqd1mobDhuyk5Nr77T6yLM4UW1Q8ccj77ErdenZrg203JiNYLwkRQBVmEIEUoQNV
         rC+2E9RA4piOvFDvnwWJYQSyMvSA4oX8oK8slq6bVSXkpns14z1UaWAqioiT2eEx/PBC
         KBiw==
X-Gm-Message-State: AFuF++nD0rI8fqc9VnGquQotdi56G03qm6zpZgji1YtEjppnH7Jgkty7
	4sC2cPvQY8RkwJx77QK4VTUhermVd+PDDS+/Chamx2IKNO49XVIXbdOUwbn0GCMGSnYSZ1H7maG
	u+1zZGzrVP1DpBm8L3O9HpiU5owU4zIeWn3UaeD8=
X-Gm-Gg: AYBFou2i2K/Lr8hhhxgMzdjJU3InPPQ3d0izfYYE+2BZAQ17MhxujuUung5tsVm+wsx
	kE/8FTJg9YFeLwkPa4faDx9t/UqD+00iteRERygk+YwEPTpoQqr1vAC028Y1SHTmoDDm66MlJkD
	JOfauXiiAnHYnVcdnnkzUmWTqYa+0nnB/k+cxn3i9s1idAMGRMaHrbYOPvn0JM4qqAtZDIQCAP1
	X4QAnOFwazBgSeHxcWiYoNAMPw6XVS6fvRi5FKP3lGtXSNNqIFfKFNo/KixtqISG1g8LiMLVFx+
	V10Wbr/q5PHuNZ7G/mtK1oPjHUOSHrBnkCsvsvCCaYxq+pF+MfE9lEv3rw==
X-Received: by 2002:a05:690e:4084:b0:672:bfb4:5f4c with SMTP id
 956f58d0204a3-672ed9ce11amr5498858d50.101.1790582207890; Mon, 28 Sep 2026
 00:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Antonio Soliman <antoniosoliman9@gmail.com>
Date: Mon, 28 Sep 2026 09:56:37 +0200
X-Gm-Features: AclHuK__33leC3l8DUiMWjtuTmecn0aInyfcIsEj7pxq7Bh8OFoyjg5IUu5r02Q
Message-ID: <CAGftbbU3kzBMFFG5zM3_PZEeh0mmmacMab5ec1yVSaRh-EsYCw@mail.gmail.com>
Subject: HP Pavilion 15-cs3xxx (ALC295, SSID 103c:86e3): mute LED not working,
 no specific fixup
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

Hi,

Resending in plain text; the previous copy was rejected by the list as HTML.

The mute LED does not work on an HP Pavilion 15-cs3xxx (Realtek ALC295,
subsystem 0x103c86e3, kernel 7.0.0-34-generic, BIOS F.23). It works on
Windows, so a driver-level method exists. Full details and attachments are
in the Ubuntu bug: https://bugs.launchpad.net/bugs/2155632

Summary of what I found:
- dmesg: "ALC295: picked fixup  for PCI SSID 103c:0000", a generic HP
  fallback with an empty name; there is no entry for 103c:86e3.
- Codec GPIOs (io=3) are all disabled (enable=0 dir=0 data=0).
- DSDT/SSDT disassembly has no LED/mute symbol; WMID.GWEV calls are HP
  WMI events only.
- Manually setting bit 11 of COEF 0x10 on node 0x20 (what
  ALC295_FIXUP_HP_MUTE_LED_COEFBIT11 does) does not light the LED here.
- Also tried without success: alc295-hp-x360, hp-mute-led-mic3, HDA Jack
  Retask, Intel SOF, raw hda-verb on GPIO/COEF.

I don't know whether another COEF bit or the Embedded Controller drives
the LED. Does anyone know which register or interface applies to this
SSID? I can test patches and provide alsa-info or ACPI tables on request.

Thanks,
Antonio Soliman
