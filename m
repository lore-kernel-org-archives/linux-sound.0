Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED53B2744C;
	Thu, 20 Jun 2024 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718867139; cv=none; b=jPaBdej4yEDANhLimHyFKOQPUjCmPnjaallUR2DkwMHDNeldQH435Vs3eahDZm9n4zBuZ2r1GTpmlIDanxzdPFoY+0Ev2sODP7NWQXFkEBNQcNgyvJZA54HnVpp33X1zVFRM5/EHocEAiYvaJdHa9GOMvsX77xQMfe0LW40yMXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718867139; c=relaxed/simple;
	bh=dJEzkSyweazjJTKUEf1BqydnD1RQQNyHb5AgSblIfdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXNwAGpmGf1cAkQQihRmrQ6JnWMUqfMG5hoErUsuvcw1mu1woqB0VyX4H8JLSaM95CTr6Eu7i2oeyvLb4POE43LuifN/OxpsUuIXB8OCKkVfcE5yJiJVs+cncJrLT/j0inMSZjwQHhwS7pKuVp6BM/fwzoOkrmY5dcYVU2j/160=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL1XS2yR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL1XS2yR"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so443750a12.1;
        Thu, 20 Jun 2024 00:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718867136; x=1719471936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJEzkSyweazjJTKUEf1BqydnD1RQQNyHb5AgSblIfdE=;
        b=lL1XS2yRgYec3ETwU0E0LKUN4qbACHvYO/9GCX7ceEBTnsTHRWCPRgPdkEYT6tTGBG
         Sbr77YFCAoa0IGXCdMD8yHvh8xJK2OwoQ/9RyKFwCly6XTHG5fKObS0yk4nVTzQ1JYLv
         bqZEie9SPn/jAcbYnH+zCkpLlkwcMwcFBM875OlSDSC47hrwrk12jbW3gJTgp52626qp
         fPyuyN8LLdsyIecshnNoQy9EIhw1unb18WUvWsh00OJzq5iQ1GRfJ0Jv8Dt8xnPptBp3
         5AhWqpLnhomJXFwAXtxqq7tKfk0IU399wy3iKSSILWhxJiqjO9zwaqaIsktYg5MgE2H5
         o8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718867136; x=1719471936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJEzkSyweazjJTKUEf1BqydnD1RQQNyHb5AgSblIfdE=;
        b=FvvDFkYsD2Hl+AleSoQc6goSk6dUAA8reO39/8MshsDSeJgUMj/907KOgASJ3xVeKM
         PPbGuKSTiXsnwJCTYnpB4X/fBxRrasOtZ9i+Ok/pkGJ2v42O9k6qy7LyLNLw2F7/4bun
         94Ej12LIGnlZ2EWa7M58YuEHhn63aO6kRw3uo9K0uzUMaC4p2DE+4giHf8V2mtDRBjaJ
         G0B98pkGKRosYblotH6GFBDT/Na1hBSO68ACad1D35xxj9Epj6lma6xrPVE3s9iMZl57
         yJcbDzDVayl822155aO8Vm7v6yHvTX1yXF/GBXmeiSA5nGjG9lJkK9Mmb+wnMdSCPlDP
         S57Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlNI9YpajZa01k2quHtgQe+05Fq3awuMA8s8pRxKAzYDHZSCVnQXuRTE4o/boj2KyuXSPVGro5+fsWntHvb4L8UPCq+NlQ9iEAhWRIjL8l9LUmN3rAHF12WwoXqWp2hrhr7WFXV+0u
X-Gm-Message-State: AOJu0YycuTqC+IVvGXf71MJ9oT24+Phmt12ltfjsiMeZ8G+PGlhzao8k
	63mORZRstcXBZTpMDQtLrVHs/X9FaZRoUTAaW0PkRgxwvzcD20iIcH/uz4M2LJ9OSJ5K3VEya9c
	u7w9nB6C8PHBCgAktwIhwdbVnPjGy7oPKpkE=
X-Google-Smtp-Source: AGHT+IH9Zi075xLIea9HUNdZOY2FI+hFSTobEwSf38cByPkAEGv6hOZRLG60t8CtapdTRB2mmitpm6FhzBhArR1rZmc=
X-Received: by 2002:a17:906:81cf:b0:a6f:7826:41ea with SMTP id
 a640c23a62f3a-a6fab646fa0mr230471066b.39.1718867135834; Thu, 20 Jun 2024
 00:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 20 Jun 2024 10:05:23 +0300
Message-ID: <CAEnQRZCKR6G4-fP7YVsjLvpKNHBQGNYa4TwxS0U0hdheFjxxBw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: add missing vender prefix on filename
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Andrew Davis <afd@ti.com>, Baojun Xu <baojun.xu@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Beer <daniel.beer@igorinstitute.com>, Fabio Estevam <festevam@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shenghao Ding <shenghao-ding@ti.com>, Shi Fu <shifu0704@thundersoft.com>, 
	Takashi Iwai <tiwai@suse.com>, Vincent Knecht <vincent.knecht@mailoo.org>, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 3:32=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Many Sound yaml files doesn't have vender prefix on filename.
> Add missing vender prefix for these files.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
