Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A18255E43
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396906; cv=pass; b=L92GZTGs+XrQH+Vv8kYEW7Cd+sHgITqvy2vri4JjfdNgjaS8ml/GSZjZcUwH20o7REEBQPOZxP7WnWCBO9RHr+ZHOlxyJuam+DXyruNiyxuE8IHF2XNsHGixVcNeL1b7jlLeKZ0lrlosOkWshx5yY2AIl5Cpf4PSg81JxzGwLKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396906; c=relaxed/simple;
	bh=gF8A8r3ZdauI6VbTKUCHB/m1RT4UMpNofJUQpN4fjuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM69Hz+F7eP++kwCLh+dxbaWkUibPeFUxmJWmOlPR6y1Aatt7cuKI4FgOL7Jl9OtBHmKJMhJMXIteruqCavKwnAKnEsOlT5s1taNujQRBe5KDJ+J8RUZa2LqhHrrPGNK8PjKzjZrtZGqQi90oCwsvJ0lFDMwWhL3itmzOODPUb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrxflrXU; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrxflrXU"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so1234475ad.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 20:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776396905; cv=none;
        d=google.com; s=arc-20240605;
        b=KJ+a/5utxNvoEH6UH0OLn0ly8cqSQl1DFjeQ6lf6l+kaSaWhMC/PsMfuu91v5vqctw
         aq/De9R9TtwsE2L0DQnD2pK9tg0mhcD321ONZnVo3ZUWIiUPSLmbSap4DR53WHL57QAJ
         +wyHaa+eYV/wKDtWupA273FW97xTkA2DFKBnK9NhtMHjDjNBqhmsaN8nLOka9ec0zzJN
         x0da7l36oajq9UW5hoZ/uO5OeKnTCg3MBk9YylXxGoZt387Z2lfW6rqj8jfidWYZdMW6
         S8PdgDPx3XwUrRoidLGvPPcAPS7ehGm8QOQSVwOOzpJ1P13rSmyRRAlPhCOS89kL9vpq
         sdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        fh=QS9++iJiExk5PPuZpxYOTpkU0nNiSk4dFJL3QxQiKJc=;
        b=eR95kZR6X2oQ7/bo/WwId/84EjbFvloF82w9h16Kmg+R93qnnvMGxHMrNbZueqsj6c
         We0qUKov5f8iD+QdE9PEqYG2IUKsjiRcAD/GQH6L/HjeV3LIUigZfjiWIlsv/dEc0HXv
         PY5VDFL+25bS2Kmwigm1FfiP0O1K4vNY+7++AfO4tc2t9DFdaGFwraL+qT5vcc+B5g+W
         BKvJmZ8+tLHO+H7u0GsaJANLWjgosPmctr5UtDb4N43Q5BwOR/rTwg/PcQ0689Q/L26O
         LK2HBsaYH8QrclhcOX3Afek2nm4KNI+KbSL0iPMxwsvP5NqlPiZpVT+4j5Yh4I++K/av
         XsGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776396905; x=1777001705; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        b=IrxflrXUAoKobTxdIMerywyCrtF15EjcFjGquxT77OG/HFd0ma6x8bS0tjpqL1spyG
         eIuqi+Xsn+9I+TRvzzZIpLoFgRUvRrWnhplSjOQd/rIdIMxTjr5BHriKCiafCdWZSd6V
         DYFxH7M0HXbK8UPiqNFN8stZsdK1sgwlVjcXJ1WxIhchFGA2k+SfgW/G+Jo8GSklFwpO
         EEeHRRqAOqXnvClf0NQzGW90r1pSGXdO454+udFMy244w0aDpOyTFCawBgML4WNoUlkq
         ErkMy+cYTFdDTu6xVDoOohR0uosm7w7W1KO2qZoklcO4AcR5fWq0XaRTnGsmqz6IT1W8
         EBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776396905; x=1777001705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        b=qqPxnye71LDy9ZDGCcTHqEur7WfBk/XJ71Z2olP8AvVZqqcW0raAOvabdiLCeuAnKU
         MG2AefGsmCZXb9d2fovWRysISxtajJ/VOPb5ej+YJUGstn+FDhX+Qzewk4TduxJXvvsr
         BgAJlSVgwuI3suQTOKZxhbK6pPS80tLQpa/N2zQm55Ssxjs1M28HBp0X/XN6rNwqIxY/
         u5h0Pgq5/ZWJEv5hT/fote7NF5QdpAuq/bsrEB/RtVjCVlYQtws7ZChFvVKEzhbVZSe1
         5I3YnkEaf039O0rhVhW58PaByOYeXQT//Sv9+qD5SluWEUx4ADWNsErsEpq31AtIpcXP
         Y4iA==
X-Forwarded-Encrypted: i=1; AFNElJ/cMhJ5GtNxj2vaGBBHEoZ7mrsCqa3UII3KGWd6HC5MwnwkZXQTpKkIN6rSvVD1dMJEVZS4yaTOhG67hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBXsrXJKJ/jlWozCJOG0bwEU53i7XxIxiBSoV/cu5NdVlzUdJo
	RsUWffr+wJsh9ReB6ywHoO8rt9UcRybjERpaTgU1PP8q/O1ReysuqxowA3fTEaW8SSac1JIgFeU
	gDXxgBL+gQyy7hvJeXKPTlBWWTsgYJII=
X-Gm-Gg: AeBDiesqnTPxvsjfDiqQI43M21+b7B3G4sYiGaGsUYsvq49N1HPx7inGX2FnZ444x6u
	gCkeKmBmQ254HJ9GLKvl1fgf1VVpk0RazgIk2luDE/G4TxgJGhqJtSGuzpQTvbAtQBiDaoSLqLy
	7btuPOltDNDcRHBIZ5jSvg2Q0Sp6gq1mbx6e9WBcACYq47mk1Xm7nYrmhWcwxXrmg45Z2spcw3C
	zIPpkcIqdq7jwuXIj7r6zb7p8kWcLe4Ol7Wold21VrlTmMnV5WGtKzyhAuGEnAnMBKlVrXv4ErH
	R5tsZiIwYPoyAHxTXkGytJwFw3jTdkL6qmP1YPpbAwqix1F0NF1tBpj9Crg=
X-Received: by 2002:a17:902:cf4a:b0:2b0:4b3a:9b4d with SMTP id
 d9443c01a7336-2b5f9f1c862mr11314295ad.20.1776396905005; Thu, 16 Apr 2026
 20:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
In-Reply-To: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 10:34:53 +0700
X-Gm-Features: AQROBzCSAz4EcsSDgTBw_xZT_iFIxHM0p5jci8Pn2_CPreeChyeCa29QXqIGGq4
Message-ID: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

Thanks for your feedback.

> Where does this match the driver?
> Usually the functional clock is called "fck".

Regarding the clock name "own", I used it because of the following
implementation in the current driver:

   clock->own = devm_clk_get(dev, NULL);
   if (IS_ERR(clock->own))
      return -EINVAL;

The driver currently fetches the first clock in the list (index 0) and
stores it in a variable named own.
That is why I named it "own" in the DT bindings to match.

However, I have noticed that other DTS files commonly use "fck" for
the functional clock.
Are you suggesting that I should also rename the variable from "own"
to "fck" in the driver code ??
For example:

    clocks = <&mstp2_clks R8A7740_CLK_SCIFA1>;
    clock-names = "fck";

But from the hardware manual, MSTP refers to a "Module Stop Clock",
not a "functional clock".
So I'm not sure if using "fck" here is appropriate. Could you explain
the reasoning behind calling this clock "fck"?

Regarding the FSI clocks, they can be categorized into two types:
audio clocks and module clocks (which may include bus/bridge clocks).
The driver itself does not explicitly handle the enabling/disabling of
the module clock; it only manages the audio clocks.
From my code tracing:
    At boot: The kernel automatically attaches the PM domain and
prepares the clocks during device initialization.
    During playback (aplay): The FSI driver doesn't enable the module
clock directly. Instead, it is handled via:
    genpd_runtime_resume -> pm_clk_resume -> clk_core_enable ->
cpg_mstp_clock_endisable.
Since this module clock is essential for register access, it must
always be the first entry in the clocks property (index 0) so
devm_clk_get(dev, NULL)
can fetch it correctly, right?
Please let me know if my understanding is incorrect.

Best regards,
Phuc
