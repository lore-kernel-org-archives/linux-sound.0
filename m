Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170943F7880
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482789; cv=pass; b=rpCQpgA8SyskulVTWyqyVwiRRpfWxdbZf+l7XS6nwKyskhNjnZSWHAhwuVGAkwr8OtOVqqy+COBWcufI2oT0xXqSQG7Rm+lGriBkBBRc6pwCO/10ZhZpubO7Qw/LnKvFThicdxOD138EsRk1Tno+6+WBFBVOppsFJXqOq9i+x7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482789; c=relaxed/simple;
	bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5q7FD5BDojSkOvDSNc5a4PllswCH1Ggv4lnPJhPpISKrGJl98jVOhH3KXlWHPMH+rov2HKlStYO1UpZIcYlbUYJl/n9zZsnF6IG/t7Cp4/St7BhZGlhxtLCeLWOkNA1yyqn+8cw4m9gGyb0PStDRMYi0N4ql11WeVIe/LYo/lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+WbIpkL; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+WbIpkL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8296d553142so30557b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 10:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777482787; cv=none;
        d=google.com; s=arc-20240605;
        b=UeLfA6ksnsD8fWTSOUudpuwcqGsoogODs45ExrgA6ItxKeXPFbrgjTOA4z2GSD50ah
         8rb3L2SimiHgfTozq0yvGVXsS6rIuONY92FGhtQQ68WGTEGG5WYKPuIoIlM39vhcsxxE
         cpiaf+rcuP6Mm48i/oYKNbt1zBRbMZQDqroLoWbJg23A4Z2wthPcYMw9DbGQvQ3jVDYq
         1dlAFmXW79BLLq79tCKga4E/xR4nnmvMs1fJSbJJdt9Fmq7Vcdt8TrsRMGfX6cc8pVwn
         CaCG/UxOM9EXgq0FdaKi7x0nEUs2qMfMHSzO0WeJAb+LlthP6uPXcAlX4ZQyAG1U9GiN
         k91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=;
        fh=OL2ea8uw1XT5iGeAWCtwWGOXZagdKx02jvnONbwdpDg=;
        b=eQq/ZgdEGe4q7HNGpb3oyKlYBVYUu6uHv8voGCC37lOh0nf5T2QAqIAkMT5YaCeOaK
         xSzfbP/8DQNAF0zyZMQaoWHTEANc6Q4PtRAYpemcA4mLgls5k5Q/bffseZypmL8BkWkK
         21NIPkLPccNaTvM5N/OHQ4/zCh9v10Ph53Zu8XIIUIKBYGZI1tBwgR4iJURb8WjSuyRC
         39//na9lJh2BPqrajLqST0jilUiazTcceTqVA1QQaUSW1cITENfCVKycCxbLtCzRcT/u
         GlwipgslyQcB06lWxP7et4JWssOJz4bgt+1P0weRRUHe3uQl9pz2GaKDmP4gC41Z8Jf8
         Nnag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482787; x=1778087587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=;
        b=l+WbIpkLdmYuJJYHZiBsvRvJQpua16fxHwYlyCjjgdhnCYtnySFXc0uUrSqU1VxSQA
         faBXPfuV1ggf+CUzZgmOanbGjvkirE29Vi/V/YDe+8nHFSIly5JsqVRrsJFN6KMP1y2H
         X1DVPnOjMY6H2eD21d8q6KkeC64LMMmbVNhhifk4Kt8uNWdyxIsg3my33sNltNk2udrw
         IX2uqkLlgmBoWePd+fURIUytGZ7IG+Z/+Fgoz1OvSSYdT29YDdrPcf3cl//UsMlXf1BX
         tokdN/WL30wRNhqAOtBuZfJQIk8FXsFGUGMqohU5XQVNfSlvA9XrlC/GVYmfmLRzEHh9
         CwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482787; x=1778087587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keKJyATHH/9XZlJC+tuXNxKnBFaRlDa69beG7NG/Ie0=;
        b=iR4BenQnOxccYkZHtnMgYzvBaxa4hO+ipwe+olgGHcdoz8b7s2tftRrZEjYKKmYP88
         +/zc+uzw9Zx3AlsiufcpcZ6Ab9LgsjGKGnTolssIexlX3dpOC6V4MIF0zoxCSwEsz7c9
         +SBsuZQ2vIDazbYqz10Qbp31Bq257JyjSRYO7BSDqvpah3jO8Z1SZXJIqaewtO5tg+F6
         ONUqPziFSbRaa/iZplyjAQ7CLC7EWPoAj8TfOiQMPGCsP+badJ9seWTlxK8qhKE7z4p1
         +4379jDLEQT47aO0AcmXy0w+FlZmQHCv9ZdHaHdcTHmYPRtLyhfGh2oJRBRIz4WGiz1q
         1DQw==
X-Forwarded-Encrypted: i=1; AFNElJ9MZ0C/LGjGdM0p3X/zwXHp7smuRA3DmSziukw6hYi+rXuMYZ+n4M86AvW4ZmSViDi/Vi2EBbUAvfnUYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe8cC7Qra66E5ROAWua9uUpkz+t64VbzO+4ApfYxkFDwJK0UJc
	QKJb05yXjhfs0agJJuVCvIyLW+aM4WJpTF79JX63D8AXRf1+V7SYmK89CaDJEi6IuHm+++edq4L
	YYpvlGHlQ243hkTI2VUz8TEDr/shmR1A=
X-Gm-Gg: AeBDiev+Fy0SRNNb/SXI+PXesdNNSjLih5GOKroP5ChRiuk4eQmJgs2/Es3bL6X9CO8
	gn8fw0PXbeMtLhB8hZTukrrW2ut7K77MS9xmHyp4Bgcnb0uQo32FqI0p8+wGduxEk7xkRZXQ1ig
	105SqO4L0G992ExpAX65dWZWtx4Of0BuBsTf+4bqxlPxn/4jN8/+JbckGo2+cHlVurAMfBAGruH
	MsRw9z65o6wUbB+0nB6Q5tTCyQN3wnVXYPxf9HLVk0H61gtWxFUaURFHFjFY1cVQEQLmDYW7nrL
	XVLgo8BddQD7QdHDH9JZsNREqhM/Rs/rtjCIGXC2qMnsA4qJnNHVaiXrcZP09WQpK6kwqfFWpai
	jl3Zf8bo=
X-Received: by 2002:a05:6a00:338e:b0:82a:5d55:5807 with SMTP id
 d2e1a72fcca58-834ea5688a1mr4806793b3a.6.1777482787258; Wed, 29 Apr 2026
 10:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll> <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
 <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org>
In-Reply-To: <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 30 Apr 2026 00:12:55 +0700
X-Gm-Features: AVHnY4I11t3zhGT597ar3Rdt0vn7aUxGwU6Xnaq00d5qQJd5Fda2EZBP9xaayKI
Message-ID: <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> Yes. And the ABI. You cannot have ABI which has an incompatible
> implementation. IOW, when implementation contradicts the ABI, something
> is wrong.
>
> The question of course if read_bool() is here incompatible. From the
> actual code point of view, it is compatible, but how it is documented
> and how it is intended to use: it is not compatible.
>
> Also if future schema-kernel-ABI checker gets implemented, the tool
> might report here a mistake for that reason. read_bool() means property
> is bool.
>
>
> > If the hardware supports wakeup functionality,
> > referencing the core schema is sufficient. Hardware description should
> > not be constrained by the current driver implementation
> > ( e.g. the use of device_property_read_bool() ).
> > Bindings should remain stable and generic, while drivers can evolve ove=
r time.
> So you claim that bindings can define property as integer, but drivers
> can evolve and for example read it as string?

I see your point regarding the ABI semantics and the intended use of
read_bool().
My understanding is that the I2C core currently uses of_property_read_bool(=
)
for wakeup-source as a presence check, even though it has no way to
determine in advance whether a specific device will define the property as
a boolean or a phandle-array in its DTS.

From a behavioral point of view, switching to of_property_present() would
not change anything, but it would better reflect that the driver only check=
s
for the existence of the property without assuming its type.

If the expectation is to strictly follow the binding types, then
of_property_present()
seems more appropriate here.
I can prepare a patch accordingly and send it to the I2C maintainers for
review and feedback.

> >
> > Re-defining the type locally duplicates the core definition. If the
> > core schema evolves,
>
> There is no re-definition here. This is choice of subset of types.

The flow is: core schema =E2=86=92 YAML binding (ABI) =E2=86=92 DTS (actual=
 usage).
From a high-level perspective, the binding may appear to redefine the
property type by narrowing its scope, while the DTS selects one valid
representation from the permitted set.

> Where is Rob's suggestion to do such cleanups for EXISTING code? I only
> see that new code should come like that.
>
> Anyway, your commit msg is for me incorrect because it misses all this
> points I made. Whether the schema code is correct, I'll defer to Rob,
> although I still claim the same I claimed before at v2 or v3 of your
> previous work - this should have defined type.

You are right that Rob did not explicitly request cleanups to existing code=
.
I included them to improve consistency while working on the new parts,
but for now, I will stop modifying the existing code and wait for
Rob's feedback.
Since there are differing perspectives, I would appreciate a consensus
on the preferred
approach before I send out the next version to avoid redundant rework.

Best regards,
Phuc
