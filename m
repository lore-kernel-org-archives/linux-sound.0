Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794086775;
	b=QldjbPbdqOKJWEsSlfj8LKvqy+Y9YDOHgkRJzQBPX30TxvnL/iAhKGzcihbR7Wqdd8Yy
	 7EnE563gwthEhhUX7y3bwYOTEbV/bMotYlpTvklWkLCB3FghTSAAXmtaNM9P6iN9wQ66S
	 FrTxsVXtdPP3xDni4xhGj4TIElSwE3Yht5XbjYDTGpA1pZkb7gKhgNfvM9YBW9Ty/DZj9
	 PoCc8s8UG2ZYLvnnE04NgLF/dDyLzdxydwohO2zSs6HhWfn8bxwpEctR0Pd5s9fXYIiin
	 /OUSQUk9Id0EHJCqUYFE02YziL2S3rYPF0IN3DQp+aZpGBS1km9hiRrk72r8T60wqlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794086775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=73WEKiUzXivXg8C2IVBJyfaF2fqfQiUkwdvZf6j6LfU=;
	b=iddxNIDgxCf399fLtcxvBmZ9bWA+cB/iptWTzG8jBd6P+I4wI+f6ib7QMmVSeG1niLqp
	 ghF6kKf+TtjoIYZonKEYW8lJnN/4Jiie75WugNKlqyAoQv9IuHHp8mRQT65dz/elXs5l1
	 hDL+qmj8Ij5WsHw9PNiysyAQYRcibz26ujZX5g5cIoKn+JeBq1HJ8Mx3wZ5xBMfNoHsmb
	 Aa6SihW6rqwf+hvIAzgwzn0Q7pJtwbTWbaI9jvAkriz+DCQIGuzSlGRfLGVQZbToQyaup
	 cb3euAGSnfdbypCVXrcRMel6l4f2JAKVWgbMlinKRod0XuA5RfPtzQ0GG7DWtwGZz9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ir1Gxfwj;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83975606A32D
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 21:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83975606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ir1Gxfwj
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so53370f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794086774; x=1794691574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73WEKiUzXivXg8C2IVBJyfaF2fqfQiUkwdvZf6j6LfU=;
        b=ir1GxfwjT1acF/G6B7adWbxTCPx5aHU1dmMrQ4VGXOh9e+V4DnIAweDff/JOssWsVk
         dTCEbp1SEs1+OGL/SatQD9OE3QMpvaczeb20RQpLP4KDA1jgUOm71CnAEjsPcK09B0gJ
         bJ4Uh597W7O1oucVEovnbpJLOVNNdC7darrJrTcMlzoYkt18tKPdvlnUCMlCnaEhDW8m
         WCQfEg1Gri9HuE20NOvI8tYpHdgvGm16cm4gBEA4l+ifhnN2gYQEQ9l1NdRXEKvpDASX
         +vaKjFaBGkldKK87sI38A4t16dAtsxK7XvrlBfR6Oo2lUreb6ia7xZISukngFTqoNXdG
         4vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794086774; x=1794691574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73WEKiUzXivXg8C2IVBJyfaF2fqfQiUkwdvZf6j6LfU=;
        b=XPlNeHhlh2rZw4VjF7a8I/FDpz5WRlY55hWYRDkgm7buE8rdAw/7QFYHgzJSQkqO5T
         HyylmundRD+DleHYuu2nnapGjVFjaVcFDnAWVKOEE31QUhiPDOTyCucSGnt9Hfr4zRw1
         87R4GZbBalNHpWP1NfrYtswQHObqHqbwl33B++DvYeVNQ/kwNWhBz8hzosrSxI41QuXN
         /bf+Sg2wqEJgv+JGRrP2Hcux1yDgr3Vn9FWE3icDdlNLlC2116sAdwWUFJfX2tgG/T3F
         4qXaOkSKQVyoBoKfGTLFQ/qT+I0GrKJRBtOXsD4PAWcxo/HUlmnkDEe5azlbRMZTH3zI
         +1Xw==
X-Forwarded-Encrypted: i=1; AL+hErG9+O4pFK7XRcn59m1Pd+xJuAMrCaIv/szp9VFO46HqzwtvlzJSzheR0ky7xnzrncSoKlLNqrM6rGclTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CBUk0pAOs8hAD359cQR1RyZAgWoLG7kzTaD4PopMIkk7RaCbm
	fvHKmy7lgbK1Xac4FG1WgoCwqgYKr62utayJPaWPWX2FjQO0pT/RceRr
X-Gm-Gg: AYBFou1UAbOHH4XUTdk27/mDbAvUF2BggvMXjljxORkQbl99dtBpTH0lDfuXgCjMdfc
	H9mPI6CywImdAsMSD874O5OdQ2OnX2Cj5OVbxyitNDmt13/OvJKzANR5NzxbCxxy94L2fKwQwrw
	XhUrq2Eak+pY5eDNUATd84dOEL8CKAC2iVWufADqvxdkvCZWMFZvCLbKr3N/xsGQcxegROFcprM
	kAVU+2BWtvne+8k77ggTpJUS/gO8nMmopN1F7kWth29hN4fGeTcc5zj5Oj/2q3EbZwRrrU+w5cM
	itBwdI0w18NRZ/UeWaPD8WfezcFtXz+nac4WOrjsUiMjjB65bow4PF8ySQRN5EEYgeUfLYIvUgl
	jY7z+clg3iH0Sc6onpb8k0pvwrevQeOBfFtEE8g/j3uJloIggOk0wx2JjE5BTXN0gL1KMdlAkrU
	ffvpN9wDyxC3yspovftrCSsb6LX2AoXORX1xg7R9SvzeBE1gzPy4jz2HxCfqc4v4YM2hGSjJHat
	EN+VjF6zfZu1kUb9BR7g5pM/R+3sFf5vJKv3z+KihYYf+NXhxbqmZuzqjD1pBsgMwT+PJ5i8KdG
	wNYZCcilfPbh7Xpk9oRGAUo0d3GXbxt3Ilbw3Osr/0osT7uDMB8CxcWWmC1dDxg5UwSMmp2axp6
	BiNSlzCLENrgBX/akuZrylk0rGXYKEkStK5Bus8W2t79gTCPmC7IeTNt+ecps0W/D+66zhrjMZ3
	q22IzMChBZgwnC4HlM6uVuUnKLq8gQRKgyqMxV/MECWwZ/jpiHxC2DDgBa03/s0GdPXANLOViE8
	Z6o59X63LyznpLV9Ww=
X-Received: by 2002:a5d:6f0e:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-4958b34c506mr263267f8f.23.1794086773593;
        Sat, 07 Nov 2026 13:26:13 -0800 (PST)
Received: from px13.tail3a7e86.ts.net (91-201-161-73.ip4.as24916.net. [91.201.161.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea51cbsm232117f8f.27.2026.11.07.13.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:26:12 -0800 (PST)
From: Lee Mann <leepaulmann@gmail.com>
To: baojun.xu@ti.com,
	broonie@kernel.org
Cc: shenghao-ding@ti.com,
	niranjan.hy@ti.com,
	antoine@montane.tech,
	andrey.golovko@gmail.com,
	pierre-louis.bossart@linux.dev,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
Date: Sat,  7 Nov 2026 21:25:52 +0000
Message-ID: <20261107212552.10990-1-leepaulmann@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260921111930.1040-1-baojun.xu@ti.com>
References: <20260921111930.1040-1-baojun.xu@ti.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Baojun,=0D
=0D
This patch, now in v7.4-rc1 as f42fbd560cd8, drops the stereo split=0D
from tas2783_sdw_hw_params() (v5 changelog: "stereo configuration=0D
should be handled by the DisCo table"). On the ASUS ProArt PX13=0D
(HN7306EA, AMD ACP, 2x TAS2783 on SoundWire link 1) that table is=0D
never applied, so the split was what gave stereo there.=0D
=0D
The ASUS ACPI declares the SDCA function type without a DisCo constant.=0D
Both amps log "function type only supported as DisCo constant",=0D
find_sdca_function() bails out and the per-amp init table is never=0D
written. ClusterIndex (SDW_SDCA_CTL(1, PPU21, 0x10, 0)) then stays at=0D
0x01 from tas2783_init_seq on both amps.=0D
=0D
Tested on 7.3.1 by ear with speaker-test -c2 -t wav, by swapping only=0D
snd-soc-tas2783-sdw:=0D
=0D
  tas2783-sdw.c from v7.3 (+ a local volume-restore patch, no=0D
  channel changes)             : Front Left left, Front Right right=0D
  tas2783-sdw.c from v7.4-rc1  : Front Left from the left speaker,=0D
                                 Front Right not heard at all, right=0D
                                 speaker silent=0D
=0D
The v7.4-rc1 driver probes cleanly (no tas2783 errors in the kernel=0D
log, both amps Attached), so with this patch the PX13's right speaker=0D
no longer works on a stock v7.4 kernel.=0D
=0D
I agree the split is wrong where the DisCo init table is applied. I=0D
saw that myself with the SDCA fallback from SOF PR #5904 (which makes=0D
the PX13 table apply: 0x01 on amp 0x8, 0x04 on amp 0xb): with the=0D
split, amp 0xb went silent; with the full mask, stereo. So the two=0D
cases need different handling. Two options I can see:=0D
=0D
 - keep the split only when no SmartAmp function data was parsed=0D
   (sa_func_data absent), or=0D
 - land a fallback that lets the ASUS table be parsed (PR #5904 does=0D
   this for mfg 0x0102) before 7.4 final.=0D
=0D
I'm happy to test either on the PX13.=0D
=0D
#regzbot introduced: f42fbd560cd8=0D
#regzbot title: ASoC: tas2783-sdw: right channel lost on ASUS ProArt PX13 a=
fter stereo split removal=0D
=0D
Thanks,=0D
Lee Mann=0D
