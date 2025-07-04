Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81720C00B
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625597; cv=none; b=ONxbzbIysyVSTS5HAor3QjFZnoPjEl19JMwTBGfeHhg+tC4gywlb1tW7W6J4uzDwC2melIP1+xsXOkAKCXdTU0scSq/wLwRV0IXWp/ECyvZNRw48a2CNFwlNw93ZD/Vt/6hXxDuIxaaSQU50Y75Oko1g5gfLaj81evXXoY0tpeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625597; c=relaxed/simple;
	bh=kCFyDLYy6rS6ij+ryr1xRDqg9XEGckH88zq1N/OEgRQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Yuf49Mp7ezD35V1lXXPm+18hLwaOxfa8b+S8II6rkL1QVIchtw1HX71AJ2Zy4qAiUZkd+8vQQ35PTgMPqg9njgLyjhBdyn7FDactYIgxuXgpl1sIfnO3h9ZtewdCM2DAWW4Q+PBVQew+5ef7zS6feFN6+/b01OpurOpC7vbx1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODiicWmy; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODiicWmy"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7efae1bfdso165170137.3
        for <linux-sound@vger.kernel.org>; Fri, 04 Jul 2025 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751625595; x=1752230395; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kCFyDLYy6rS6ij+ryr1xRDqg9XEGckH88zq1N/OEgRQ=;
        b=ODiicWmyVOcpKRe6nTuhoCwLFLzGw9KumD7Ec4DIF4Kozr/1rby0TtoFtA5NuKsEQ9
         1ZCLa/CxTm4RT330U5Cteji/5uClSczxU+NY+ogUoPBa85FuC31LQ1efPF/Uf9aUZNTx
         V/s8oGCD9BGLPJnw2q9Wo2ULILr4Rk7rHNW5LVv4s/eh8lJjiS+U3dbMbxQLcUAcFZxJ
         v4g5ftKgzSefuI08w/CQV0GcyJtx/oxNT+GRamd/lslNAHD2/vQ/wFto3RiPCysu/P2N
         7AM6RPH7wrrLhbmYErS0o8Q8XhPXsN/J/dOlRtOoqUWJtMlKdjueFN+K0Tz6IsM7HnVd
         FyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625595; x=1752230395;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCFyDLYy6rS6ij+ryr1xRDqg9XEGckH88zq1N/OEgRQ=;
        b=NSWQ46VlrhbIrYcLvjuazpTpm3DCHAytm4JLmY85dfHddkx0/0GRYApq2m/lbDUxjZ
         GchCs27VAbnOuGWH28wpiKi953H2yrhuBnV2b//eLKAUnzmNWdg1piWJ7f9/ENlkeeGj
         JZh3BKJxbufTMT89zMXVX7nAISLvQ9zNGsLlFWxiHdFeRIRQxnwxDIvRLE96bt/D2eo8
         nhl6LI3lrhnR7rgOmk+fDNPpAypxvQcIuv3sbMwkSDZy0bzwtmw0SwbkQOe6conyaR9h
         nTpvN5oT1JdpcIyFyRDPRWKxXvGHYyn6dBPNja5ARlw8aYNPplzg5UvXtDS5xo3rZcPj
         31pw==
X-Gm-Message-State: AOJu0YxW/alFfr0WS0L86Mf81dhgS5HphRls+cr7+N7wvqJFTwQHvulO
	ukmUCcfhBM543ry1nx8rauFd8IP1i9uLmdXkfi8mKXoUMFucHreUIcEet3bHMeK3Y2nAvAe09rt
	njbY/ZRM/vUlDBsyZVHlVTV9Yu+GaTvl1hTqi
X-Gm-Gg: ASbGnctaLvLUKe9BEa/xxe9Sl9nFClztTAGvkO95InJoogiery4SYESZVEmsB9lP4C3
	KAdkCpmn9fQtZ9Mr5l5of4sPv5fbuRVF/YW/2psRvaOFEX0SFdfthrLLa2bAIwF3W0P9XGkSznI
	9Cu6juu/J+6NHvtrwYXEusvXIbBrKfLF7HPs0QLYfOmO8/+ZYCxNVM6hwurGTPaFRIzHFhEZm0
X-Google-Smtp-Source: AGHT+IFx/2C0z8L3RPjzvw7b8nVTsd8Y8XRdjxN1FU9K/fwkbMWPkI3yHV0RmAcAk9T4nzD0b/MBzocOM05J1llH/bA=
X-Received: by 2002:a05:6102:4412:b0:4e9:9281:85ba with SMTP id
 ada2fe7eead31-4f2f2447d71mr513048137.13.1751625595208; Fri, 04 Jul 2025
 03:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>
Date: Fri, 4 Jul 2025 12:39:44 +0200
X-Gm-Features: Ac12FXxb75JM2DA4zaLFNZR9WwEvFbNDq0b_nkWdY8mAiGYK6ZudB1a1wDJkrVI
Message-ID: <CAC8rN+BPJb=nmbprRz4UxFbuv_776wXvEcXCkf7f5dj3sG9s7w@mail.gmail.com>
Subject: Advice on enabling BCLK for SPI-configured codec
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have a codec (similar to cs4270) that requires configuration via
SPI. However,
the chip will only respond to SPI commands if the BCLK signal is active.

Currently, I need to keep `aplay` running so that BCLK is generated
for the chip
to respond.

Is there a way to define a machine sound card that instructs the SoC driver=
 to
output BCLK without active audio playback?
I could directly write the SoC register but I think this is the wrong way t=
o go.

Ideally, the bit depth and sample rate would be specified via DTS in the so=
und
 card node as the codec requires a specific bclk frequency.

As of now I'm using the following soundcard as a reference (I'm using
the same SoC):
https://github.com/torvalds/linux/blob/master/sound/soc/mediatek/mt7986/mt7=
986-wm8960.c

Any suggestions or pointers would be greatly appreciated.

Thanks,
Nicol=C3=B2 Veronese
