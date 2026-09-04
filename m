Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB6517BCF
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 17:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543917; cv=none; b=CRfmHzDYuLrkzE0JvAufXg7E+eLbY/+Int3Vi45pdM06vSG989rtCsbz4DqIRix0kG6RCHRXAgDbeMMsuug2rE76cAvDNBMQPEVyISykx5gJ1Ecj4tSl/sRRpsLmjP96f7Fz4KDVC+0froX/VwWHmdkNp4UQODTw6oQgiSMYgic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543917; c=relaxed/simple;
	bh=5xeMxtX1fCh8OGl3ui+hhjKrfVCy12n88MgVgMcIa2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tE5WTnOMrCC9izRcHTZkHDeSwcxPBG1gh95IUVzIHar8zdln9EWjz1SYH5uF4LdnZVUru3RMbCZXg6BI/8+SMOjCpnHtycrxi6WJTRBbETqJvadEjQnpUb7AX+6fyJhH+rBLnR+Kvrk8DI4rAVxSVA0nEZDQHspdWOfcjKAZfyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmE0vyVY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmE0vyVY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso1477192e87.3
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788543913; x=1789148713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUYDwrBykVcOFXxIJuB5joV8Yatru/7oqjgD9YEMvFo=;
        b=PmE0vyVYyDsjh535BUj5s+uxbhla4+kQkFzqB0ORSzwk+GEVMGmGlDCC/8gW2NcIDN
         jE2pwhQtAKLIt2F9e5+rNaIvjtAO0XYaGKRrhGYpsSpVxqpCMWvQ8Iny4iNg5gttuMGc
         4FzrcF3ssQ4ooJxEml5SmvrtfVC3ZfHHYXABTHtjGqPYpeR5qOVkDl/oaOY9W+KE8x8H
         elxs5MLq2j+vA0nU/8tCCTaCuTih6mUVokK+H/ZMUf26Q5l8vohKh4fg3bBdiv6BMF8u
         VWkVNKOqT3UnViRsQ+DS1fRzO4z2qRLTj9AmeQdD/Tbsv/KyKu7Nq/SKJrOKbM4qhBb6
         fdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543913; x=1789148713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUYDwrBykVcOFXxIJuB5joV8Yatru/7oqjgD9YEMvFo=;
        b=aLzeqqJZwgsNPr5qvHgXZDpda7fXSHLQg8NNXNRMcSb02Lxu0XnQ6sgBNwok8Q4rRu
         cJaKp9GHciacjtKagpFUADcBGD9ubkprY94A/hm+YCgqzuso+8T0hnZl4w/djQ09Ykim
         Vv5T0+lC+xkSOzH+ChxMaSD2xo8cTt4IupO5PtuWBadubuJ1hIQ42Aw81sOfRQZBkB2k
         kjjRt1FyTI50uviscvWIAIDtCOjGG2miUrSDPOGX6r92ta0gNmHTLx1X2zbYIb0WByWw
         QbZFyrhK1pCfINpNNz2lFqcTWD2Kt37n+7VsaNNyppVJ1/T82oyfYaBA4noCZKpU7QrE
         R0Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwnb0iJQWvDsw8F3LPloh4AiIfQ0GXqTx/j8YJsrMKjpP5rmE6wUjSXczEYxzG6Wv+cr8vp+qh7RV5TUA==@vger.kernel.org
X-Gm-Message-State: AFuF++kFR/I3pcGQNmVyIgr2NJjAh1+iwlku2Bryc7GohkBXNUzF4ISy
	6e71Dfu9q5fkWNYXFrOHQbIeEUEooUWW4uespF9NZoPpMOWRrwlOWWW3
X-Gm-Gg: AYBFou0toHTzcpXGTX1iLGIY1IjrUzj1601cD1GDgwKaU+8kURxM5hR/qQXJJiyD8dK
	H8iBq2li/hZ9EJS+7bhJ4LKVQsYE7TcwsCe3FtugSy6FSSZ5vAnT8QtA4H+9MWQoKIrS1pvop3k
	OAcq9DS/yfn+Yg5VugP0qj9bQ1+elqNnIFvYNwswvSyKTLsN58ijEomvng1j4vJ8i8Z8rs8bXyf
	fuHxH6IWiktfJ05j91TOrUQBIWydbxLHtLHdJYiIpN7UXHwpEC0Jx3et8OVTluMTzgu2NYCJQc/
	kDlAzE2+YjmAjIjFiQh7/F0oK+DfmC3sgN/UdlMuB3sslpsmI47e70UVt68GdFyYkE95ZUFEhcX
	Nryp7FX68WQVapQprojaZf/Lt5/PMge6DSgiJ3apSnnlS3QbtEKFNQNoza4t9o8rPweLIzmpIgV
	0JECMb+++qGM39yfXFV30Tuwbo7pOUtouRBa7Op8jr69kpH9J9TYuORQ1jozqmMO1m1x0h3u8bS
	JBRNt9oUrIfUBoDefium9JYimQ6vMuh2Tf0sr5Ytgryp8Br2aWTXtOxONxk7nasIuHNt3wDUuhN
	U+trSEo=
X-Received: by 2002:a05:6512:3ca7:b0:5b6:1a7c:37 with SMTP id 2adb3069b0e04-5b61a7c0261mr894499e87.58.1788543912418;
        Fri, 04 Sep 2026 10:45:12 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b616700006sm644118e87.57.2026.09.04.10.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:45:10 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 2/2] ALSA: usb-audio: bind the Topping M62's vendor controls
Date: Fri,  4 Sep 2026 22:45:07 +0500
Message-ID: <20260904174507.3952588-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904171646.5301B1F00A3D@smtp.kernel.org>
References: <20260904171646.5301B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> If usb_audio_probe() fails on a secondary interface, devres is
> synchronously unwound and topping_master_teardown() runs while the
> orphaned mixer is still in chip->mixer_list.

That mixer does not exist, because this device has no secondary
probes. snd_usb_create_streams() claims the streaming interfaces with
usb_driver_claim_interface(), which binds them without calling probe,
so usb_audio_probe() runs exactly once, on interface 0. The hardware
agrees: /sys/kernel/debug/device_component lists one aggregate per
card, both on :1.0, with :1.1 and :1.2 absent.

The other half is not there either. If that one probe fails,
chip->num_interfaces is zero, so usb_audio_probe() calls
snd_card_free(), which takes the mixer down through private_free() --
and that removes the devres action and destroys the context before the
driver core unwinds anything. There is nothing for the teardown to
race.

The same premise sits under the findings I acted on in v4, v5 and v6,
and I took it on trust instead of checking it. Those changes stay,
because each is right on its own terms:

  - topping_master_unbind() no longer looks its context up, which is
    correct regardless: devres_release_all() moves every node off the
    device before it calls a single release, so the lookup could never
    have worked from an unwind, and the component does not need the
    card from us anyway;

  - the teardown is a devres action registered after
    component_match_add(), so it unwinds before the match array that
    component_unbind_all() walks -- the ordering is now expressed
    rather than assumed;

  - topping_master_bind() returns -EPROBE_DEFER rather than warning
    when the context is missing, which a WARN had no business doing
    for a state the framework can reach.

But none of them fixes a defect this device can reach, and I would
rather say so here than leave the impression that the driver was
crashing. A v7 cover letter will say the same.

Mikhail
