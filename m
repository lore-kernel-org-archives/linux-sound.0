Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A42E370F;
	Thu, 24 Jul 2025 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753397429; cv=none; b=olZ8XGFq60uy3ybbe9KzFpV39tx5ZYDolklOpO4d094zKoxBV+VS00Fw+A6JHMGTdKnGPbAhMaC2ub9UNxclVZrPtKjXjwzoa1TZvzPhae74XJ8IfKzYtOBboJ+kaADbAniqxFKlFK6KMIS1xhEKUUvEX5/FD0dzx4nIKJVbnUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753397429; c=relaxed/simple;
	bh=9RcNQpBBWu+hx83pSsO7O/9tzmQjZNTSzHmCQlb+F3Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jEmuGfxoYMjP7i6qPFEpdmvGX6oSF54+igJIn1nfLAUc3Syh4+Hre2g7XY8/K+FwIhw8/na3cazt4Ay3IwsHhFTDfjMW8xqu4LJaFfzNJ3kXtDONjAbuNnoyfL1pTz/HWkgi95BOdiNe+dimqBE5Vba2vygzel/wah4qHQuS520=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjV7aJjx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjV7aJjx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso1347185a91.0;
        Thu, 24 Jul 2025 15:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753397427; x=1754002227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zZBqKS+D47d9bDHf6ej6fEXUhUELlTunCIn8ZEJfsQ8=;
        b=QjV7aJjxVzqxZ3azlZuvo1TK6Xv8dseHR5qDswqoW86Yo6loRHLPURgEdu7s8xPaxe
         uhKSZZz0/cmrw6J6SGzvBuE94jb9qcjCZXxt/EMs/bksQsC1twDcuS7R+gH+mrS25uiD
         gP76oYj1id+SbEhuzWFQfhk1xMyvyO0UA5b+So4pR8Ep6G/Px3h/hv1mx0qTLnYy7g2E
         uxF/j5Vna7R94qGmnGAQo8keo1E2flbb5VyyBy/XYPLSaFuvGHGqQjZQ9LxRHgtYlpog
         fEqb5cU4vEP5olc1ODsYyLkavDB9laKfak3UR85T86r/AU9dB1Otsc6HAunos1iaurDG
         Da5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753397427; x=1754002227;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZBqKS+D47d9bDHf6ej6fEXUhUELlTunCIn8ZEJfsQ8=;
        b=jhQTARMye3JsbcSuuyRoM0yetDvZUsvcDcdOVcXgZjWD62H5pDAcLWN4GaC/ZG5GI9
         5FJhNOUZhisuHYJNkWLo/bqmZIghIcriOqTyG4MlCS0H8TsKTc3i/qCQWOy2nVi0dqK/
         t/EhMO4qGLpJE02sF5GxVYKuyACZR4Dx06D3YVTzOhFXNduWbnW3HS15Otpkoy7hnkiu
         wY81pD/V6AqYBZG46ueTP/Kv5AxfqomhxlpvsuJ91hxBmvcriKMzsVvJrC751CDDIU+n
         wqhYooFQm/8b6nPv6fadMAEhrD/q1TH6EfgyjASDfPgGzuXT4JTjceJ+ltiqVgLaNFjC
         osEQ==
X-Gm-Message-State: AOJu0YzZO0Rm5pqFS2wariT8vrDeU7Qbs9i28vib8eY4QCCXGGu3PlBg
	EMrBXyKL4G42QXLLbl+XcLKmkNPtMcLTqLdScUDGcqbSS83iyOzKhxgadMVoATXdaQDcoRVHaha
	gXBVQgxwVTc0d7oeERY5fbBc4dKStOmYfapk=
X-Gm-Gg: ASbGncvCXZoHqrfRw1PTrWUFLtAGGr5j63okIwXUR4oMvwjNnEVbMMH5bCIpem9WiwY
	mE6AOvQMZrnmsfjwbIWoTDdS24DbYJRfJ0rpH1NVQJu9v0Y7KhQZNJwLZbRGJbEUMuUom76tFyY
	6tPjtjrNrJNY7VhOk/5us6y9fUPKiqa4BMy5tNQo+RyNFZkl+SKunydOak3ry88qUNy+dSqY0iz
	4y5mB29On2i1f7bdHLACdnCN6M5HhGJJ6xa5tMcPFymVS+2GQ==
X-Google-Smtp-Source: AGHT+IEGdmRpCtDySKf2ld/UhLaJh6nDgfFJg8UeB1iXIfLwrwrvBxoC7N1QxhJbpK4uH0MUCAtvYk1qLStd/m9/OsQ=
X-Received: by 2002:a17:90b:55c7:b0:311:b5ac:6f5d with SMTP id
 98e67ed59e1d1-31e5080b4f9mr11697784a91.29.1753397427325; Thu, 24 Jul 2025
 15:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Fri, 25 Jul 2025 00:50:15 +0200
X-Gm-Features: Ac12FXwdbPKAznYEbF3K-DLZDr_EpEOZhRKF2nkDD0qHhTPXkQAF6rq0JK8vDKw
Message-ID: <CANBuOYpLNAtLVWBvR9E74Ju4cM1K7H_bS2Z_UhthQFrJaZXmiQ@mail.gmail.com>
Subject: [Guidance Request] LFX Mentee looking to contribute to ASoC / DT
To: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org, broonie@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shuah@kernel.org, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"

Hello,

My name is Jihed Chaibi. I am currently a mentee in the Linux
Foundation Mentorship Program, working with Shuah Khan.

With a professional background in embedded systems and a strong
personal interest in audio that extends to my own projects, the ASoC
subsystem seems like the perfect place to blend these two passions.
I'm eager to apply my experience with hardware bring-up and Device
Trees by becoming an active contributor.

To get familiar with the subsystem, I have:

    - Studied the ASoC framework (the Codec/Platform/Machine driver model).
    - Learned about the core audio interfaces (I2S, SAI, PCM, PDM, TDM etc.).
    - Analyzed existing DT sound card implementations to understand
simple-audio-card in practice.

As I look to deepen my involvement, I am writing to seek advice on
where I can best apply my efforts. I'm particularly interested in
finding a substantive task where my skills would be a good fit, such
as:

    - Enabling audio support for a new board using Device Trees.
    - Assisting with bug fixes or small feature additions in the ASoC C drivers.
    - Tackling items from the TODO list where my DT experience would
be applicable.
    - Helping with other driver enhancements or cleanups within the
ASoC framework.

Any guidance on finding a suitable project would be highly appreciated!

Thank you for your time and for your work on the kernel.

Best regards,
Jihed CHAIBI
