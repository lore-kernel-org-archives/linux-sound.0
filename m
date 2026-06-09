Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000F280A20
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995955; cv=pass; b=dCZX0qrsO5CXRxTINB7F4m4ZrRe8UBeov0Lq0+y3pDqQh2hh9e7gf9I21xPi7Mh43CHq5d8w11n6qW4ZnG4Abxsz6Ps9j2dUCeXuzQXjlm4C8OLFXE09VjqfyOqpyuHCN3mkWJGU9I76O77spwW4TpVo8hwVTcuoZgTJT1NB8QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995955; c=relaxed/simple;
	bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYmQ2/7PrFGC7q28tMaOym1vAr57qjO01oNUQuaGODJcBbHwC3TLdaGmKeV3AeQnzaJ4TfPto6ACuMzph8duLevsPi/ObiDkD4OtN1MO8kLIGoBi7iBlHjDz6YxT1goyXzlqU3ILV3X0PwwkAzulL5yQHxtLvlpsC8aINTXXExM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLFP5dU7; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLFP5dU7"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f1d8902so2186979b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 02:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995953; cv=none;
        d=google.com; s=arc-20240605;
        b=aazPppy04uBO6gX9R+m1ZtDsfALtEJNnNdZtG1zAhM++g+Don+5yQ9rlP7jGuVkGZH
         jxnZMwvD9kN7EZP2SfNPku/vbHA/z27dQ5SMFpXuN49unQRPefwBOfD9Bd1JLa2VWMxt
         zpmhyxO837K9/TAfqes6j9BHNl1TZsW6hlaEVytcAG5mldKsteIeV+MVSyp53RevvWN+
         X70ga+EM2zllgnyt2Zcoa6Tt42RAIin79DrQJQM7xlSAxbPGKasQevrNdK4WvQN3n+wt
         Oax+DZ18RPqTGaT0lLFUwzsCbYsxq2TDl+Ze6fDnYrscZzIPgJwK2qN8iazwGRMOnMP0
         fFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        fh=Kw7RZ7zfSLzurTDoRtXfwisPRj9dJ1O1kqFb9kVKKRs=;
        b=XUkLPGcdXkCjwDWbyADfpk9HFW9JPEVA4qk8MUlqpujEr6Y5qT1POutgILZL7UXUFE
         a3g619nWuhnrLTup6cBfCYbZU1aVvRAM8GZt0RrIowULfYl7rWomofCtX7s2cq4O3BVU
         g+DVVpLOYfKNHecvc+TxgtZEi7Nx2KvDQkL3RYg6dCNjzqtin4SISa0+RJUcc2BNxYed
         9X+QcEbzA5E8Co4nEJYW8ls7H2adKE+iNCRW5BoDVsefr+QDPI41U7wvkFSFUTinpUQi
         9K86YgIh84CDdwfgMkL/YlrYnRP7i5R2ZI3SNPk6w+ZZxtwn7u4s6ex5wbkzunctuxM0
         vfkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995953; x=1781600753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        b=YLFP5dU72+eR5ojwV4xaHmL4Dso7O4lJzTJZ75n9R6BizL3klJHu1pop5GIrA3AKIc
         gaTKtelrPVxhkrTpzIK75mDOI2BYlUvjejp/A+zalPTS3QywffToqcL0Nasxb37RsnON
         EgFh1hfJXQEiHDm0L8+KVscG/3whYm72vSeQwySN3Vx0Q9wnfne4VXwehDcy6vUJDWsC
         bVR7gi2JUaPtsjdRroZ5X48OYz4SYu3j0W2+F3BAGNKzJtFkz/BnT/qoYbdOyq7XQg/T
         sl5nsc/ILE3oOiaLa0UYaDow44NwBQ8SBppOj6VgfwY3KbS0Oycp886y86+Z3pNfJMi1
         b3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995953; x=1781600753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        b=AE6pVdDdAqffWeRgcnvQI+QU3fXA0+GcHbj1wE5pLIW2UF7t7PG+O4sfIhqkw7Fyvy
         3vJ2lM+YLkltRLJtn1LqWgNBlJAukxieLBQVdFGfAayMaZNw10CeixCrK5EabU30bpGk
         psIZG8+J0zXj0RnLq2U+4PCXO9OkJ3fMVnpbalNCPbYJWuSBA3WpJN4fdgxrjAIbqQIt
         kVhGu6LRdQqrGKrf073uZMJP49SGGKznEl4tqC3DIai48/hGSx3u4wMsB3JnCcsPR3Q4
         JurGdTDRVJoXz3WkAAU8m29pEFoI31tAPHhcCaN8svZI4wSlmgfWGC764FI2g/fLVwGr
         whFw==
X-Forwarded-Encrypted: i=1; AFNElJ/QfA8q2F6jHB85LJrT4EMzdGOE+yiPGC4Edfn+H0ppM947j+DQHulrqpBoqxmusDOhTrWR0Kq+5i8auA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gfpd8O2LwAqsjk2oGenj1Bdhpsnsg65ibIYgyTE3a1H/iGTK
	AMNQW1nvG4Br6YeRvhAJr0rDdfoKqQgQL9YlohZo0kJfbHOtsVUncJFm5Z67ERIiptdNlqVt8gK
	WkB6uKNLq7s6TcGk5OiHBW6eWjV+2MwQ=
X-Gm-Gg: Acq92OHzjCzt90cthR0HSM7fdkROKgmrCKme7d1viHjeQGd5T3QPnYC5hfOgsZCkCF7
	qWV+gPRoxMA7TZGWyS5QhDjLyAsmBrD0uvhwyTt2rQ/jvBT2mBPU5RdzRfPjPd5WXGv+au0cH75
	FA4gGOyYU02QmaxatG8nqKB1QF8JQ41XBqBzrJwoB2ndwGT4D0/aYcY89PE4qrU4xTU41gTz7kF
	9xrb8/8YzcOPqn0Eim+U0jejVqLRlQwthTTPelvP09ekPmE1kElqr0MXlaeLel8VQUk7FG7NjI2
	SpvwKGsilJSLtibfQis8WkEE+9gbA5U2dFL1IA87UITj1hy5
X-Received: by 2002:a05:6a00:ad5:b0:842:2419:6c0b with SMTP id
 d2e1a72fcca58-842b0e11c7cmr20087951b3a.10.1780995953465; Tue, 09 Jun 2026
 02:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll> <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
 <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org> <CAABR9nHBA=sZsw54RWMCg_xdDCeo+stnSYg6yACfzuJoMNMyPg@mail.gmail.com>
 <d610ea66-23b0-4691-a0d7-6a32e42dd902@kernel.org>
In-Reply-To: <d610ea66-23b0-4691-a0d7-6a32e42dd902@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 16:05:40 +0700
X-Gm-Features: AVVi8CdtFgeretXS95PDA9wmrlEPo8ic58fZAHHdjLlUvl-toQFSXd88bhJWIb4
Message-ID: <CAABR9nGS_Rd=tCjhCDu8EDgCLnx97mM1nqGbquHXV+mwuUczYQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for the clarification.

>
> Odd. clock-names are string-array which has uniqueItems by default.
>
> That's the first need of usage it, so I think you should skip it even if
> it does not work correctly - the true fix should be in dtschema.

Understood. I will remove "uniqueItems: true" in the next version.

While testing, I also noticed that the schema accepts cases where the
number of entries in "clock-names" does not match the number of entries
in "clocks". For example:

clocks = <&clk1>, <&clk2>;
clock-names = "fck", "spu", "icka";

This passes dtbs_check on my setup.

Is this also expected to be handled by dtschema, or would an explicit
constraint be needed in the binding?

Best regards,
Phuc
