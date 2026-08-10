Received: from a3-15.smtp-out.eu-west-1.amazonses.com (a3-15.smtp-out.eu-west-1.amazonses.com [54.240.3.15])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7499360745
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.3.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386973; cv=none; b=ng03GYccUPQS96iGWyhqj/zajJU+1S4MHDrAun/vKyu4etDWqxWWflsRAkwEd3G973A8xN8vVCpsmF6K9qREhKbqwaeBczoOaV0OYSQynLQQxU0ZRVeH7DLrbzcQFS+x6MfDuCXuTNwX7asY5FQfmGp5dQyQbvScmRpsEt80lxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386973; c=relaxed/simple;
	bh=ei2E23oVjT+DvvQc9hX/yoIR0bLz3234BEGb9y0vp2M=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=cl6dAwrYnrF6U/5uJFp8AqQLDgjU+3ur/zg/cD3Vs56pnmc+G9x8GFOa/G+ilBIEaFtclTr3s6idjmyqNuOG2Uf57Qc2mzP6CaZ7Djz1hdTbVqAXGXICuiJfoYGvgu2O8/IDVVs6BuzRuvgTT6KGCl4jI0B9DhQr8fn3h3BxTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=androos.io; spf=pass smtp.mailfrom=send.androos.io; dkim=pass (1024-bit key) header.d=androos.io header.i=@androos.io header.b=vHJpw4o5; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=qgxNKiwG; arc=none smtp.client-ip=54.240.3.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=androos.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.androos.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=androos.io header.i=@androos.io header.b="vHJpw4o5";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="qgxNKiwG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=androos.io; t=1786386970;
	h=From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=ei2E23oVjT+DvvQc9hX/yoIR0bLz3234BEGb9y0vp2M=;
	b=vHJpw4o5zLJcs/0OxeYkGqIIOmHxOav1NpXlVT+dWjCOiFaiZC0hiRXSQTSB3a6o
	yn5fRGsmgsFzPFW3Wmv825YUWm+jRfmbaXLiX0oXBCSRvy/CwzSl0TRbK6tdzZAQwCm
	64/S7jM0KY4FFZoRSqD+nb6H6kUE5u2vkZyMkjA0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=shh3fegwg5fppqsuzphvschd53n6ihuv; d=amazonses.com; t=1786386970;
	h=From:To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=ei2E23oVjT+DvvQc9hX/yoIR0bLz3234BEGb9y0vp2M=;
	b=qgxNKiwGDSGTYwO9aiRhFkoRXdeEgECDqJGA7+tDllOoR4qsTnzKz4nPTAvFI56c
	k4ZRRtsC1fZQ7lbYke9jAGMRh+dHuYSE3lqNFkhfHNxigqyfG8MOiH4y2ePm+qbsWPW
	kDOigr54neqCmDgYladLsTXVvYgcDqNtjZ0AdG9Y=
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Neil <neil@androos.io>
To: linux-sound@vger.kernel.org
Subject: subject
Message-ID: <0102019fecf5f684-c867d228-4830-4c0f-9127-3f016fff1ecd-000000@eu-west-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Mon, 10 Aug 2026 18:36:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.eu-west-1.3mRTAxKqFuDMEE9BXCYRrSI9F/ZrE+OZZeY7XuVrscQZYVwMgTK2N8YsUG39Y6T8JbXGI6yd9YKkugDdKBPWmdzepROBy0b67ml7dTIfUOsjr0TXUDI53RxcdxxVrIw25aOcYei8jbkRArpDbKOfZ3iU5uSK+z8A8A2AHps5yx4=:1.eu-west-1.KEYBhYy5skZtLAf2ooWkoQwfhj0g1VAvm2T4fzvEpSk=:AmazonSES
X-SES-Outgoing: 2026.08.10-54.240.3.15

subscribe linux-sound
