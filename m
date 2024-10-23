Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5711BFE0D
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729724265; cv=none; b=Zpa2+SSI3k0+qONVXopMH5iw5gVOBOFOLIUVTKtvTzNVXn1MLB8yf3NnXjirt3NhhUuoUV9HnC2sq753Qm24Hi7GSyVYCdUhNnTiC8MXxUBORAfK1op31y0fm3pfXo7/7jJzm56WfvCuf58qdCdT7orIIKnKM0Kfj01gaUBriiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729724265; c=relaxed/simple;
	bh=S+SdZ8EpAaBzJFdwXuKbqmJQbay0ivoaSRhFhK+sZk4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ie/Xtongz11MG6ypDJaDfgnNaFvr02/39IeMGYniEGCV8In/wjn7sT7y6K/BTh5a6SnhbT6ir2AsrjKXPEZgSCH33GqaihIZmfBvgScc3IXPEUmFfS68N9NT/JCj3QG/wo5ARRTg7ihJUKzqQqImX2TDQrHz/nEg7gj6yJBlG+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MH4yYE3h; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MH4yYE3h"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315eac969aso1870375e9.1
        for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729724261; x=1730329061; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S+SdZ8EpAaBzJFdwXuKbqmJQbay0ivoaSRhFhK+sZk4=;
        b=MH4yYE3hCk/kEluI9cQnCp+MsCpNEVcSRpJ5PVjdHjaBzN1BrEoj9P5HunHVmG2+pM
         34LrxBHCgVk52fisN7oGPY4+v01ohrzn/9e0wFB40i06TiFjSGLn6Qb/1lrtJvDYxXRh
         soAV45C1FvHn6V5TdLB23C7XjDZdxqvvwzjtqaf1CVuAnbwrgT5FsVFP+Q7uaCsTf3c2
         h2VkoWzZ6iHZ7WjWA8gBr7oitr8Y3jmXFvdtjfm3AYAgBlQK8DUWe9RYJoXGKt8mJNAN
         dB9FFEpCR0nZzyoLPtGro4IIX3wKTHsQQnwxFkB4rCd7TS0zVpxrIpvxzxfZ7hmsIvWd
         7xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729724261; x=1730329061;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+SdZ8EpAaBzJFdwXuKbqmJQbay0ivoaSRhFhK+sZk4=;
        b=juKtfegluR5u/M+rFAD/P8MXsnc2GspsBI87Aq548LgcttvVS5qj46aJfhqq9YGHyN
         Ws2yPTKQlRPZ5vX7q2ki8xaPKN2j9Y4FCaIqV84rJG7jVHZDrN1uQtVaG2ucppR2fcKr
         shRyCYKW/W33gmUgsVVt97Y1FdyRB1IMc7iHKxGJvofWB/gFi4Xsg/e6cR3tctl3SVzf
         oEDZv8/u24A3UgWwMYNqpBnBkSmdgBu53TVgAPNq43DzBbvtDo7q6vlxna36AvFEUs8u
         PF7GuzP+1r5hvc4p4AyPe+/5XK0uinWrMogbiKfKCyrWULh5dW8mWu+NWDai5sOTP5jG
         sp+A==
X-Gm-Message-State: AOJu0Yzzk8PZLzZk1cdEs2R8uH6+loKabO62cKd2bK/Pv6k3bbOiRNxm
	prffJpkxwjwNi1xB8DrFTi1dtB/AIfT5ur0E78vzjGCJfDiywBPKd3WGcKbwbi3SD8nfFZ+XJp/
	aKakMHsaBAiQStU1woZgg5I5PxWdvS1Dn85Y=
X-Google-Smtp-Source: AGHT+IHsrm2yTxMWtqRH4mmE4q9OWa7csAg7stI582GebRwhic2f6U7VLQKDYDxGK0I1TMsOZMzffwZnv8GR4NjPiUQ=
X-Received: by 2002:a05:600c:3147:b0:431:44aa:ee2c with SMTP id
 5b1f17b1804b1-4318b5c375emr415465e9.9.1729724261280; Wed, 23 Oct 2024
 15:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pol Xhaferi <pol.xhaferi1@gmail.com>
Date: Thu, 24 Oct 2024 00:57:05 +0200
Message-ID: <CAGhxWJ94RPDY6EPqE_RpSyL6t2mE5POWtUXpwatN346QXW1gdA@mail.gmail.com>
Subject: Disregard previous email :Pch/analog card problem
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Problem seems to be low CMOS battery. Had to hard reset/press on power
button without power source for 2 min. Previously to inquiring on
alsa/emailing you had tried 1 minute as recommended from web.
