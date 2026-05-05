Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA94279F8
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976090; cv=pass; b=hlrfwq9grNr2oeiRnG8JvGv2tKjnDrhp/U5uwHfyRJWS4vqChWAKCSWDZgYjyTyaD0CT8KuYYn+k1Ro2Zg1eUCfM9UzWGH+y9J4QvHhLX4O8hOd3UNCqeoI3+pKxGtQlGy9jNKsZ3212g+YSsQKfHH7yasLcXXVJ18CA52E0VV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976090; c=relaxed/simple;
	bh=Oi6yT+ns9jMtyqJ27Q+gEhh8JyJgi0gFq61CQyPkBek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhXiLIKVb3O0P5/0f6z5zISx4/2y0h59cJ3ZWv/QIBFoUlbqF8bQBdNjlSrkeG3nrh0eHnZp0PgwKT58LRPG5JHYBa3icMsqXmIHDIYgFOJcc13X2M3+Q1oz8SIsXfuSqm9T6rfHDtgorliS4qx+6cF7nvQ4op8WMHM2MabeCWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDDLI+QD; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDDLI+QD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so12787905ad.3
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 03:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777976088; cv=none;
        d=google.com; s=arc-20240605;
        b=ZczukCwzo3jnoSYbCLXahKr3fzmXhp8i5eiovlmaYR0Rg6c///b9VuWmRgVht4T9Ou
         b/H4p2bwMJuPHkuNk0AOmcem9R4j57MqtC0FkL9uNPb5eKYahS2Q2hHq5nowsQ1psYGv
         jeeAxQGJH6xsIV3TBdkYBINrtRU5vFloXIF1jR4AG5CR/JfYRi0F6fvDzmrGsab49Nt6
         SiMkcOlBA2evtltbO2vgRnDt7aCD2eBEUlDd1+y62FQflzFDE27XoNEoXBYOo2NN0xLb
         L08J3ilKzsVfwZZUuT/8PGHZPwwubH3BJtEgK5fJxlIdIh3TzYSGdxQj6bGA393UvJPA
         OmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        fh=uU+LkkT5XcWewvD/kl/bWS8+cdHoXhvoUqn6URlvwxs=;
        b=WJ+oGatmb1BrERrx2zMwYWbUHW+aP8EfrI7RiCWcpJBOVY1NtDNubgPW5zYJ9qc+vd
         UDO2VpbtW9zfgyVATL1T+OJ97Vy3TW2/2v8ZqlXxenGXls3so+nNl+XCbsGAo3kGU4u/
         rTV2/MY13kKhZruKxeZ5retYfpP9PbAvyJ35AinW32yZQoeMBoEDu8lrnvyIHlFU1hOn
         laYZnq8uVGCyiJYPQXl41V6Wwt+bf9U8vV8ia32ZYnVH2se09QwW5nP4c9RPcpaC35Af
         1FTsWvztB6BYSVkiHb9QCMs6G4HOE0UMO7ieXIM23XqTX1G4WpYvJIQkYKslGeeZbakF
         /4QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777976088; x=1778580888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        b=mDDLI+QDmeMtLto1Q4m4gOzEOgDVkLIg/58vdeppfDgdD20fKmKJSc5oOBYvKrC4PG
         c0KGxPE6LUeM18TJTIuCi+uSEVkxFjNz2HDyZMSW2iJ+q63cJjMsipStwxsHJS7vBIek
         OKeDmqDsh8By85nocdzXAqdltw4grbOwRY8r1kJ6dN2+noE+24tHtB/zaFTdfJkhy8v1
         4spTvTN6AnxDkmVqEz2epuao8yz9V3tyO2iNbBi/dmS9XBYzApERcaaVk3JECUYd9pDs
         Pbp0biZzyRX7CORBEYwW49P7Sf+V8IymuRuFfq54CkOwfc8lVgkzTX+HLe1/fhf7RYLE
         Pn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976088; x=1778580888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        b=bEDV9/cEI40R9ZCvlPjsHjjO66R9MgaET4lHSECAREKxr2EUtYmHrsQ2VJqbf2MgN1
         dXADdgjsn3uDsi90IJdmbqqI70gR9u7Woo3p7XEG0ylYKdIZJoIhTUFxwevBvBHvXyVd
         HNeJ+ikZlnYVC6f5mb0Uxu1k33ncky/benzfk7OCj3h6yNQeR3jZ7rExgI9i/IXGHX1+
         8thEhQC0RPZ1HOdb9VeUgjbqCj2FBKKeYh6hWYT+JvryR6bftTCHzGUBuKPs60p/Dfix
         x4+YJvF2mF13/S9iEZQTSGw2s4nc+Wr5NJ3sHa92yTYJmmP5Y2ugtm1JmODOV10vLOwG
         HaEw==
X-Forwarded-Encrypted: i=1; AFNElJ/30ckwHCPaUywuY/zy80HqGbihVts9q8LfReoHpyo5bCbyrltX3uIrE5/NWa+hhXAHiJfNfLoRhFp3xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO5DT1gdpNrowsMXEnaQAAlnVA/AqYcYPlDH1BuCyU3twbcv7t
	42y8JLR0wDiiGAa6qyek10fVO9zLOR0Z8qo0gKb7Vr/B1bYLj5jhv1MPomiBiwx7e0I3dzna+ta
	XFgUBoIbZbVnTTC5pIn72eBEFg+SJda4=
X-Gm-Gg: AeBDievd3+3rNDPBdzKqmweAuLqhbGYNB2ANUEmTH68Y9x5pM2/NTtLeVOQ6+Lddur3
	+yLmA0gd20OChlBh6ROKZBMF/dI06SbQvnu0NbM4NjryDKmvP4XGebi4gBg0xPA8At8YWx3JCyk
	w8r1xBST/sHoshlu+fDxK9PQXCpdTVlDj1P+4mVvpaYghPXw3fSw8LRmj+DG15bTaghb6OBTM30
	lh3dL5DxdCCac7smiNPVqHMSNFKRSsqR9BNw9cNCM0GV/Ap1Tg1J2kAREGHwYgVKXBD9n68pDD6
	nWYUo48eWh/o9HS2bBIgrBOjFlxFS3AdkWtNZzIirX+AyjUa
X-Received: by 2002:a17:902:d50e:b0:2b4:5f69:715d with SMTP id
 d9443c01a7336-2ba53764d5cmr24069045ad.25.1777976088099; Tue, 05 May 2026
 03:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
 <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
In-Reply-To: <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 5 May 2026 17:14:37 +0700
X-Gm-Features: AVHnY4KKaeMIUMNB9DnqOsvfPK4v3pBOe_aV3xzWOSjuBgzN0epZsRTKH_TgDIc
Message-ID: <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

I=E2=80=99ve looked into this further and would like to share my findings a=
nd
get your feedback on the next direction for addressing the issue.

The sequence is as follows:

(1) IRQ fires =E2=86=92 handler starts
(2) handler is running

(3) playback ends =E2=86=92 ALSA issues STOP
(4) fsi_dai_trigger(STOP)
    =E2=86=92 active_streams =3D 0
    =E2=86=92 fsi_hw_shutdown()
    =E2=86=92 clock OFF

(5) IRQ handler continues
    =E2=86=92 fsi_count_fifo_err()
    =E2=86=92 register access =E2=86=92 system hang

Since the trigger() runs in atomic context, we cannot use APIs like
disable_irq() / disable_irq_sync()
to synchronize with the IRQ handler.
As a possible approach, I=E2=80=99m considering guarding against register
access in the IRQ path when no streams are active,
for example by adding:

if (master->active_streams =3D=3D 0)
    return;

at the beginning of:
+ fsi_count_fifo_err()
+ fsi_irq_clear_status()

To support this, we would need to track the active streams by:
+ adding a running flag per stream
+ adding an active_streams counter in struct fsi_master

and update them in trigger():

if (!io->running) {
    io->running =3D true;
    master->active_streams++;
}

if (io->running) {
    io->running =3D false;
    master->active_streams--;
}

With this approach, even if a pending IRQ is handled after shutdown,
the handler would avoid accessing registers, preventing the system
hang.
I=E2=80=99d appreciate your feedback on whether this approach looks reasona=
ble
or if there is a better way to handle this.

The issue is reproducible when playback reaches EOF, while not
observed in some other stop scenarios such as manual interruption.

Best regards,
Phuc
