Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934070;
	b=wzOke82FiY9t32NV/u3XIMT03/hVujRZgrK4wxqtbQn80mLdd4jQKf2qsUf2fqUcvxdH
	 njAL49H//4nVrt/qkH3tgPRmLv4QZnp+G0MXprfEmx9K3hk8cxdVsZv1Q/rl4RFwpRl6B
	 p4MEeKnoB0+Lzk5XMgfSiNDKExPTxA1easgq47AZLTCp5FdBEuf2ORhlyxdrDs1Th6A2a
	 mU8Y6eMvlfzC0hKfAB6k0UHk34+aETfBNW5LrmB6HNx8qGGdLKkkE2Xye4WFlEM0DSQyR
	 kSB6tUxbpKsXhliCSgcT0wU4i9JmisoV/yDv5HmwZQ7WBpWpd/0/0AkMnJybvlg6Q+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=QppZsu4sFOtQZud6ohCI6IChh7UGD49gFHZbqnmiNP0=;
	b=QZBeSHeS7oezE1K/w0Kil9a6XqTSm6BgeHhtNq7MXhSkOTMti4YvEyLfstaWkia/4xJv
	 zfG2eajAXqF4RM74mTAM8zopA35WL9K9PWYcM/J739RAYjGSzuKtMn+Z4aEOooMFm7aIQ
	 WzjlhpyuXgCePmh0tyX5lA5YLiuH11QWSQxaEsYzIdIMqB+6hjzz8N8NM4HzOa2clUWjR
	 PIymLVQs/QPr6RF8d0OtKADWcSKskCP2KrUHUo4F/PqAOR4uNBdbY+pPlTBDpch3X6TYq
	 lkdhpEcmkYylVx1v5+FMsTixBlW9Th5bXhrVty6CIIEZ/wMS8f3OYPjb7S16hnCft5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N+ReR7el;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577B606A31B
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 13:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9577B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N+ReR7el
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-677af43eed4so2032873d50.0
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 06:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934068; cv=none;
        d=google.com; s=arc-20260327;
        b=OlmzVH0dSr0nh6JHujyEdlHMI7yay5vXAcz/hIfUixFVAK/e82UDVFa4P0thRTFtNd
         sx6A4oPJOSwZsujbfVa+qIc8TMEWFOnaGpqz/tP+AGSSwSxz33Pvw10S7Ot0wxaeIAOs
         LSjpR5jvJmgfzuRwNayGV5zTQgrIlpB+ZFQV7jLRqa3UFNJZdeG4jTl3BpGpowCooi/C
         ZGREg/qkQfykw0CHspt686fFvPOu28KFiYjBZSYYvO5otirJ/97hKMq1JfF+Jy4RX97o
         VbDqxrL/GZIASnUr1jZt+l1cbqvrTYKp7VYP1+4Ebtec/zUrnsSJ0A8g1BCBeNuRaQUT
         98Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QppZsu4sFOtQZud6ohCI6IChh7UGD49gFHZbqnmiNP0=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=Gw9Ja2J5C/kaoigmk4uKR6+pkeIvDfNztsEqZFK8ZAzIWsX+/iu8XLAQd67eCR7ISm
         DTuHWxTtLYwJbiZTIeshRp57Jkv8ifoReowzpqSzUL3e0K4jy30S7tGcDb/ICsLoZ6Ol
         dlvNYqyQOytsaqaRjYI9/o22adx2rmjQd8KIaLOAWNPL01t5RMnhqNWIF/c2oI/jz3to
         KKqBHupQbJgYD4PgxEHbGWhlInccKDJezrDsOJ9K7ENcnFCokc2H5tDMQjKw8EOJ4CNz
         zc8ufXI6Ugia0mIgjwgdo8LXU5lMIQgwyUM89EbPSStPk+lT9hlr7jTAuWdjPJi1Wrt6
         I3sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934068; x=1793538868; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QppZsu4sFOtQZud6ohCI6IChh7UGD49gFHZbqnmiNP0=;
        b=N+ReR7elsNEyV4I6sbZrcAWAT1LFOy+/eIMX11H15JrhKZNJMSLwKWPBupsYghrAiG
         8dLCtGQZ51XMO3Hb79p6hwAf/NO5Ma4pgQmJD5nlREotwNj9i99sMheRxbF4FJ1TYRtn
         Ytqk89cjqiwI6Y9SxhL6lNfSmdaAoiD8WuwpNqbS7DnUy0Mn1YlvQYMSLFbFbn4nmO26
         JW/Iqr1V6Q40di5/2SMya+j1A93oIMQ6bBhHWgytw84cdF7CaKGeTVDNFKn8jy2DIxDl
         1EElIIdmsfIFsokW1F6+XIPbRHSZPqjx1iImWmZP9fykvdaZqlXdLku9Lhc9RWhHhVbZ
         xJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934068; x=1793538868;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QppZsu4sFOtQZud6ohCI6IChh7UGD49gFHZbqnmiNP0=;
        b=A7cVFvINBgJn4ALkwHRpmJmxZ3tSk23jZoq0g566s0aZq4nX2yWCyK3mGj8rc53iE3
         2YhtxP6X5bHnFOgO/5oKnEjsC0dlj04Ei2bYtI+h4WPRHkK80zVI2bxMQezbnpLJnwfo
         BH89BcpEWQVddRcY8MCaI3h+NHc9fjKpuBIapeIidAHyXcp+W4yMXAKs7cQ9p1g1kjmZ
         fj6XzN/VO786SHkcrgzYjshaW6VtZsdCvzTt5xFVWummd1XFP2n586qHMJUI365Xvir1
         aX6phaN+hG3Q7IVv5KsKT0ayqkY+cX3b+yHWm68WQ+IwGzo7wXxBdLuAaWG3aJJZ4AXz
         vi4w==
X-Gm-Message-State: AFq9FYKHL7T/zhdW22CPV8ihmZyMR4VEAcvt4Y7IYvOnwbwyR6DvQUZc
	JWxIqhXxIa8JtWDfSYpcybjUvFl21KjJM5YmM0zS0SKOh9oF+DULDtxIooATdWFDh2cE1RcbLCk
	db3phgfY/czgRsSdxUDFX1yY2Pr8eGp1Z3Jlp2CuauA==
X-Gm-Gg: AYBFou0eC1l7jjs6u7XqG4zZPrTXrzSCLnlBNb9XQZN4+MzeSOYAPK3xuZXoH6we8Rj
	BiNzrhiLNajuysgTQqFxsu1Z1OeRob2WGKLKj9H2BsO+ud4FHHZ3sx70fW11R3aWqF03gVtp/+J
	voncItKjrUtOnEbwzVk9lGZwrx22iNe6gWaB/A5KkGutWhaRrCOrF6kXSYMAcx0lpfiaHdmn0hE
	YiTYgpeIZBsXMCutqExHXvMj/A+bo8gjrKZ4mzxVaCVBh0bLQUcy8hAoVC3+rcA8P2jLSl+4Xxt
	AjvuLwM860nx3YZnRnd1Lfz+tLpUvywRk5oviYgcRtMZ+dHDBja6PRZSvk0c7TYM2p4XVdku7KD
	QhbBkknHm7N6vWcpl7cPgqkuflDUtDyhJXww=
X-Received: by 2002:a05:690e:1507:b0:679:9e81:e50f with SMTP id
 956f58d0204a3-67a453d662dmr3188624d50.48.1792934068531; Sun, 25 Oct 2026
 06:14:28 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?0J7Qu9C10LMg0JLQsNGB0LjQu9GM0LXQsg==?= <olvasili4@gmail.com>
Date: Sun, 25 Oct 2026 16:14:16 +0300
X-Gm-Features: AclHuK_3yzeYXhSMuvNAjNrHrQ5KL8gdHiabrjrOJ23ktW_QpSyDbCefg7sHgxM
Message-ID: <CAGNYCXTS=wFYZruVzHt_k_h+cUOELTCxkcic9cEkN6BgFmynaw@mail.gmail.com>
Subject: [BUG] ASoC: AMD ACP70 snd_acp_pci: active DMIC capture across s2idle
 causes IOMMU fault storm
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm resending this report in plain text because the previous message
was rejected by the mailing list due to an HTML part.

Kernel Bugzilla report:
https://bugzilla.kernel.org/show_bug.cgi?id=222193

System:
Lenovo ThinkPad P14s Gen 6 AMD (21RV000NUS)
AMD Ryzen AI 9 HX PRO 370
ACP: 1022:15e2 rev 70
Driver: snd_acp_pci
Suspend mode: s2idle
BIOS: R2XET42W 1.22

Affected kernels:

6.17.0-1032-oem

6.17.0-40-generic

7.0.0-34-generic

Minimal reproducer:

Start with a working microphone and no active DMIC capture stream.

Run: pw-record /tmp/acp-suspend-test.wav

Verify active DMIC capture using: wpctl status

Leave pw-record running and suspend the system (s2idle).

Resume.

During resume, snd_acp_pci starts generating continuous AMD-Vi
IO_PAGE_FAULT events.

Example:

snd_acp_pci 0000:c4:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=0x0018 address=0x1813aa65be01dec0 flags=0x0030]

Thousands of callbacks are generated or suppressed, and microphone
audio becomes corrupted.

Important recovery observation:

Stop the original pw-record process using Ctrl+C.

The IOMMU fault storm stops immediately.

Start a new pw-record process.

Microphone capture works normally again.

No reboot or PipeWire restart is required.

When no DMIC capture stream is active across suspend, the issue has
not reproduced during more than a week of testing.

This suggests a problem restoring an existing ACP/PDM capture stream
across s2idle, although the exact cause has not been established.

Related bug #222119 appears different: it concerns ACP6x amd/yc and an
MSI resume issue. On this ACP70 system, MSI remains disabled (MSI:
Enable-), and the failure depends on an existing capture stream.

The Bugzilla report contains the complete reproducer and kernel logs.

I can collect additional traces or test patches if needed.

Regards,
Oleg
