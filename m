From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Tue, 28 Mar 2000 05:35:34 +0000
Subject: Re: sb_card.c cleanup
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BOUNDARY.145670968.4"
Message-Id: <marc-linux-sound-95422233424541@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95417089715481@msgid-missing>
In-Reply-To: <marc-linux-sound-95417089715481@msgid-missing>
To: linux-sound@vger.kernel.org

Warning: This is a message in MIME format. Your mail reader does not
support MIME. Some parts of this message will be readable as plain text.
To see the rest, you will need to upgrade your mail reader. Following are
some URLs where you can find MIME-capable mail programs for common platforms:

  Amiga............: YAM          http://www.yam.ch/
  Unix.............: Metamail     ftp://ftp.bellcore.com/nsb/
  Windows/Macintosh: Eudora       http://www.qualcomm.com/

General info about MIME can be found at:

http://www.cis.ohio-state.edu/hypertext/faq/usenet/mail/mime-faq/top.html


--BOUNDARY.145670968.4
Content-Type: text/plain

 On 27-Mar-00 at 23:32:12,
  Paul Laufer <pelaufer@csupomona.edu> wrote:

>>  sb "compatible" card not listed in the table but
>>  with a know logical device id will not work as before.

> vendor id. And we know what all the ISAPnP ids are for these Creative Labs
> and ESS cards, so I don't see the problem. Besides, I am willing to handle

 if we have (quite) all of them this is no more a problem.

>>  Then you could also take in account
>>  if the card has been initialized by the driver
>>  or not.

> module options, as before. But I also like the multiple detection scheme.
> I had stopped working on it after not hearing back from Alan about the
> idea.

Alan is quite busy..but i'm sure he likes it.. also
because it defaults to multiple=0 (isn't it? :-) , so nothing is changed
for the normal user. 

Here is the latest patch i sent to Linus.. it's against pre3
Eventually you can patch against pre3+thispatch.

-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/

--BOUNDARY.145670968.4
Content-Type: application/octet-stream; name="patch_sbmo-2.3.99-pre3.gz"
Content-Disposition: attachment; filename="patch_sbmo-2.3.99-pre3.gz"
Content-Transfer-Encoding: base64
Content-Description: Alessandro Zummo <azummo@ita.flashnet.it>

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

--BOUNDARY.145670968.4--
